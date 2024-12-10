//*
//* Criado em: 26/11/2024
//*
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ftpconnect/ftpconnect.dart';
import 'package:galle/app/services/database/dao/cor_dao.dart';
import 'package:xml2json/xml2json.dart';

import '../../models/cor.dart';
import '../configuracao/widgets/directory_path.dart';

class SincronizacaoCorController {
  CorDao corDao = CorDao();
  Cor cor = Cor();
  int resposta = 0;

  sincronizacaoCor() async {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO COR');
    // Apaga todas as cores
    corDao.deleteAll();
    await conexaoFTP('Cor');

    String jsonStringCor =
        await convertXmlToJson('Cor'); //convertendo XML em Json

    List<Cor> corListaObjeto = convertJsonToCor(
        jsonStringCor); //convertendo Json em uma lista de Objetos(Cor)

    await salvarListaDeCor(corListaObjeto);

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM COR');
  }
//TODO SALVAR AS CORES

  int qtdCores = 0;
  salvarListaDeCor(List<Cor> corListaObjeto) async {
    for (var elemento in corListaObjeto) {
      print('elemento CorIdInt==> ${elemento.corIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
      int resposta = await corDao.salvar(elemento);
      if (resposta != 0) {
        qtdCores++;
      }
      print('====-----====');
    }
    print(
        'Total de Clientes Lidos do arquivo .xml--> ${corListaObjeto.length}');
    print('Total de Cores Inclusas--> $qtdCores');
//!
    print('--------------------fim----------------------------');
  }

  conexaoFTP(String nomeDoArquivoXml) async {
    FTPConnect ftpConnect = FTPConnect('191.252.83.183',
        user: 'palm03@galle', pass: 'Jequitiba1602!');
    String fileName = '$nomeDoArquivoXml.xml';
    var getPathFile = DirectoryPath();
    var storePath = await getPathFile.getPath();
    String filePath = '$storePath/$fileName';

    var arquivo = File(filePath);
    print('arquivo--> $arquivo');
    try {
      // Conectando ao servidor
      await ftpConnect.connect();

      // Obtendo o tamanho do arquivo remoto
      int fileSize = await ftpConnect.sizeFile(fileName);
      print('Tamanho do arquivo no FTP: $fileSize bytes');

      // Garantindo que o arquivo esteja vazio antes do download
      if (arquivo.existsSync()) {
        print("$fileName existe..> ${arquivo.existsSync()}");
        print('apagando arquivo--> $arquivo');
        arquivo.deleteSync();
        print("$fileName existe..> ${arquivo.existsSync()}");
        print('arquivo $fileName apagado!!!');
      }
      arquivo.createSync();

      // Baixando o arquivo diretamente para o armazenamento
      await ftpConnect.downloadFileWithRetry(
        fileName,
        arquivo,
        pRetryCount: 2,
        onProgress: (progressInPercent, totalReceived, fileSize) {
          // Atualizando o progresso do download
          // setState(() {
          //   _downloadProgress = progressInPercent / 100;
          // });
          // print('Progresso: ${progressInPercent.toStringAsFixed(2)}%');
          // print('Total recebido: $totalReceived de $fileSize bytes');
        },
      );

      print('Download concluído com sucesso!');

      // Verificando o tamanho do arquivo baixado
      int localFileSize = arquivo.lengthSync();
      print('Tamanho do arquivo baixado: $localFileSize bytes');

      if (localFileSize != fileSize) {
        print('Erro: O arquivo baixado tem um tamanho diferente do original.');
      }

      // Desconectando do servidor
      await ftpConnect.disconnect();
    } catch (e) {
      print('Erro durante o download: $e');
    }
  }

  Future<String> convertXmlToJson(String nomeDoArquivoXml) async {
    String filePath = '';
    var arquivo = File(filePath);
    String fileName = '$nomeDoArquivoXml.xml';
    var getPathFile = DirectoryPath();
    print('getPathFile--> $getPathFile ');
    var storePath = await getPathFile.getPath();
    print('storePath--> $storePath');
    filePath = '$storePath/$fileName';
    print('filePath--> $filePath');

    arquivo = File(filePath);
    print('arquivo--> $arquivo');

    //* Lendo arquivo e convertendo em bytes
    Uint8List xmlBytes = await arquivo.readAsBytes();
    // print('xmlBytes--> $xmlBytes');
    // print('------------------------------------------------');
    //* convertendo bytes para String
    String xmlString = String.fromCharCodes(xmlBytes);

    //* Criação de uma instância do converter XML para JSON
    Xml2Json xml2json = Xml2Json();
    // print(
    //     '--------------------------------------------------------');
    print('xml2json--1> ${xml2json.toString()} ');
    xml2json.parse(xmlString);
    print('-------------');
    print('xml2json--2> ${xml2json.toString()} ');

    //* Converte para JSON
    final jsonString = xml2json.toParkerWithAttrs();
    print('jsonString --> $jsonString');

    return jsonString;
  }

  List<Cor> convertJsonToCor(String jsonString) {
    //* Converte para Map
    Map<String, dynamic> mapCores = jsonDecode(jsonString);

    int totalCores = mapCores['DataSet']['Row'].length;

    print('total de Cores no arquivo .xml--> $totalCores');

    //* Cria um List dos Maps
    List corListMap = [];

    for (var element = 0; element < totalCores; element++) {
      corListMap.add((mapCores['DataSet']['Row'][element]));
    }

    print('Clienteslistmap  sincronizacao_page--> $corListMap');
    final List<Cor> corListaObjeto = List<Cor>.from(
      corListMap.map((model) => Cor.fromMap(model)),
    );

    return corListaObjeto;
  }

  Future<int> apagaTodasAsCores() async {
    int resultado = await corDao.deleteAll();
    return resultado;
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ftpconnect/ftpconnect.dart';
import 'package:xml2json/xml2json.dart';

import '../../models/dispositivo.dart';
import '../../services/database/dao/dispositivo_dao.dart';
import '../configuracao/widgets/directory_path.dart';

class SincronizacaoDispositivoController {
  //! >>>>>>>>  INICIO DO CLIENTE  <<<<<<<<<
  DispositivoDao dispositivoDao = DispositivoDao();
  Dispositivo dispositivo = Dispositivo();
  int resposta = 0;

  //* INICIO ATUALIZACAO DE CLIENTES

  sincronizacaoDispositivo() async {
    //!  Conectando e baixando o arquivo Cliente.xml

    await conexaoFTP('Dispositivo');

    String jsonStringDispositivo =
        await convertXmlToJson('Dispositivo'); //convertendo XML em Json

    Dispositivo dispositivoObjeto =
        convertJsonToDispositivo(jsonStringDispositivo);
    print('dispositivoObjeto--> $dispositivoObjeto');

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM DISPOSITIVO');
    // TODO falta a parte de Salvar os dados do Dispositivo
    dispositivoDao.salvar(dispositivoObjeto);
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

  //! >>>>>>>>  INICIO DO DISPOSITIVO  <<<<<<<<<

  Dispositivo convertJsonToDispositivo(String jsonString) {
    //* Converte para Map
    Map<String, dynamic> mapDispositivo = jsonDecode(jsonString);

    print(mapDispositivo['DataSet']['Row']);

    Dispositivo dispositivoObjeto =
        Dispositivo.fromMap(mapDispositivo['DataSet']['Row']);

    return dispositivoObjeto;
  }

  Future<Dispositivo> buscarDispositivo() async {
    dispositivo = await dispositivoDao.find();
    return dispositivo;
  }

  Future<int> apagaTodosOsDispositivos() async {
    int resultado = await dispositivoDao.deleteAll();
    return resultado;
  }
}
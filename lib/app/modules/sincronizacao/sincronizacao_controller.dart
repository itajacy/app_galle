import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ftpconnect/ftpconnect.dart';
import 'package:xml2json/xml2json.dart';

import '../../models/cliente.dart';
import '../../services/database/dao/clientes_dao.dart';
import '../configuracao/widgets/directory_path.dart';

class SincronizacaoController {
  ClientesDao clientesDao = ClientesDao();
  int resposta = 0;

  Future<int> salvarOuAlterarClientes(Cliente clienteDoXml) async {
    List<Cliente> respostaFindClientes =
        await clientesDao.findClientes(clienteDoXml.cNPJCPF!);
    print(
        'lista de clientes do salvarOuAlterarClientes--> $respostaFindClientes');
    print('cliente.cNPJCPF--> ${clienteDoXml.cNPJCPF}');
    print(
        'valor de respostaFindClientes (se ==0 -> INCLUI, se != 0-> ALTERA)--> ${respostaFindClientes.length}');
    if (respostaFindClientes.length != 0) {
      //se a lista  NAO for vazia, ALTERA o cliente, pq ele não  JA existe na tabela
      // resposta = 0;
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--respostaFindClientes clienteIdInt-- ${respostaFindClientes.elementAt(0).clienteIdInt}');
      if (clienteDoXml.cNPJCPF != "NAO TEM") {
        print('---- INICIO ALTERANDO CLIENTE-----');
        print('id--> ${clienteDoXml.clienteId}');
        print('Razao--> ${clienteDoXml.razaoSocial}');
        print('N.Fantasia--> ${clienteDoXml.nomeFantasia}');
        // clienteDoXml.clienteIdInt = respostaFindClientes.elementAt(0).clienteIdInt;
        Cliente clienteAlterado = Cliente();
        clienteAlterado.clienteId = respostaFindClientes.elementAt(0).clienteId;
        clienteAlterado.dispositivoId = clienteDoXml.dispositivoId;

        clienteAlterado.clienteIdInt = clienteDoXml.clienteIdInt;
        clienteAlterado.clienteIdMob = clienteDoXml.clienteIdMob;
        clienteAlterado.razaoSocial = clienteDoXml.razaoSocial;
        clienteAlterado.nomeFantasia = clienteDoXml.nomeFantasia;
        clienteAlterado.tipoPessoa = clienteDoXml.tipoPessoa;
        clienteAlterado.cNPJCPF = clienteDoXml.cNPJCPF;
        clienteAlterado.iERG = clienteDoXml.iERG;
        clienteAlterado.contato = clienteDoXml.contato;
        clienteAlterado.fone1 = clienteDoXml.fone1;
        clienteAlterado.fone2 = clienteDoXml.fone2;
        clienteAlterado.foneCel = clienteDoXml.foneCel;
        clienteAlterado.foneRes = clienteDoXml.foneRes;
        clienteAlterado.fax = clienteDoXml.fax;
        clienteAlterado.email = clienteDoXml.email;
        clienteAlterado.pCidade = clienteDoXml.pCidade;
        clienteAlterado.pUF = clienteDoXml.pUF;
        clienteAlterado.pEndereco = clienteDoXml.pEndereco;
        clienteAlterado.pComplemento = clienteDoXml.pComplemento;
        clienteAlterado.pBairro = clienteDoXml.pBairro;
        clienteAlterado.pCEP = clienteDoXml.pCEP;
        clienteAlterado.eCidade = clienteDoXml.eCidade;
        clienteAlterado.eUF = clienteDoXml.eUF;
        clienteAlterado.eEndereco = clienteDoXml.eEndereco;
        clienteAlterado.eComplemento = clienteDoXml.eComplemento;
        clienteAlterado.eBairro = clienteDoXml.eBairro;
        clienteAlterado.eCEP = clienteDoXml.eCEP;
        clienteAlterado.ativo = clienteDoXml.ativo;

        resposta =
            await clientesDao.alterar(clienteAlterado); //! teste veja arquivo
        print('---- FIM ALTERANDO CLIENTE-----');
        //! resposta = await clientesDao.alterar(cliente);
      }
      print('resposta--> $resposta');
      // print('ClienteId  alterado--> ${clienteAlterado.clienteId}');
    } else {
      //se a lista for vazia salva o cliente, pq ele não existe na tabela
      resposta = await clientesDao.salvar(clienteDoXml);
      print('resposta--> $resposta');
      print('ClienteId  novo--> ${clienteDoXml.clienteId}');
    }
    print('----------------============================---------------');
    return resposta;
  }

  Future<int> salvarCliente(Cliente cliente) async {
    int resultado = await clientesDao.salvar(cliente);
    return resultado;
  }

  Future<int> apagaTodosOsClientes() async {
    int resultado = await clientesDao.deleteAll();
    return resultado;
  }

  conexaoFTP() async {
    FTPConnect ftpConnect = FTPConnect('191.252.83.183',
        user: 'palm03@galle', pass: 'Jequitiba1602!');
    String fileName = 'Cliente.xml';
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

  //* INICIO ATUALIZACAO DE CLIENTE

  sincronizacaoClientes() async {
    //!  Conectando e baixando o arquivo Cliente.xml
    conexaoFTP();

    String jsonString = await convertXmlToJson(); //convertendo XML em Json

    List<Cliente> clienteListaObjeto = convertJsonToCliente(
        jsonString); //convertendo Json em uma lista de Objetos(Cliente)

    mapeandoClientesParaSalvarOuAlterar(clienteListaObjeto); 
  }

  Future<String> convertXmlToJson() async {

    String fileName = 'Cliente.xml';
    var getPathFile = DirectoryPath();
    // print('getPathFile--> $getPathFile ');
    var storePath = await getPathFile.getPath();
    // print('storePath--> $storePath');
    String filePath = '$storePath/$fileName';
    // print('filePath--> $filePath');

    var arquivo = File(filePath);
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
    // print('xml2json--1> ${xml2json.toString()} ');
    xml2json.parse(xmlString);
    // print('-------------');
    // print('xml2json--2> ${xml2json.toString()} ');

    //* Converte para JSON
    final jsonString = xml2json.toParkerWithAttrs();
    // print('jsonString --> $jsonString');

    return jsonString;
  }

  List<Cliente> convertJsonToCliente(String jsonString) {
    //* Converte para Map
    Map<String, dynamic> mapCLientes = jsonDecode(jsonString);

    int totalClientes = mapCLientes['DataSet']['Row'].length;

    print('total de clientes no arquivo .xml--> $totalClientes');

    //* Cria um List dos Maps
    List clientesListMap = [];

    for (var element = 0; element < totalClientes; element++) {
      clientesListMap.add((mapCLientes['DataSet']['Row'][element]));
    }

    print('Clienteslistmap  sincronizacao_page--> $clientesListMap');
    final List<Cliente> clienteListaObjeto = List<Cliente>.from(
      clientesListMap.map((model) => Cliente.fromMap(model, false)),
    );

    return clienteListaObjeto;
  }

  //*

  mapeandoClientesParaSalvarOuAlterar(List<Cliente> clienteListaObjeto) async {
    int inclusos = 0;
    int alterados = 0;

    for (var elemento in clienteListaObjeto) {
      print('elemento N.Fantasia ==> ${elemento.nomeFantasia}');
      print('elemento ClienteIdInt==> ${elemento.clienteIdInt}');
      int resposta = await salvarOuAlterarClientes(elemento);
      // print('RESPOSTA_PAGE--> $resposta');
      if (resposta == 0) {
        alterados++;
      } else {
        inclusos++;
      }
      // //! int resposta = await clientesDao.salvar(novoCliente);
      // print('resposta --> $resposta');
      print('====-----====');
    }

    print(
        'Total de Clientes Lidos do arquivo .xml--> ${clienteListaObjeto.length}');
    print('Total de Clientes Alterados--> $alterados');
    print('Total de Clientes Inclusos--> $inclusos');
//!
    print('--------------------fim----------------------------');

    //!
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:galle/app/services/database/dao/cor_dao.dart';
import 'package:get/get.dart';
import 'package:xml2json/xml2json.dart';

import '../../models/cliente.dart';
import '../../models/cor.dart';
import '../../models/dispositivo.dart';
import '../../models/grupo.dart';
import '../../services/database/dao/clientes_dao.dart';
import '../../services/database/dao/dispositivo_dao.dart';
import '../../services/database/dao/grupo_dao.dart';
import '../configuracao/widgets/directory_path.dart';

class SincronizacaoController extends GetxController {
//! INICIO COR

  CorDao corDao = CorDao();
  Cor cor = Cor();
  int resposta = 0;

  sincronizacaoCor(BuildContext context) async {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO COR');
    // Apaga todas as cores
    apagaTodasAsCores();

    String jsonStringCor =
        await convertXmlToJsonCor('Cor'); //convertendo XML em Json

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
        'Total de Cores Lidos do arquivo Cor.xml--> ${corListaObjeto.length}');
    print('Total de Cores Inclusas--> $qtdCores');
    print('--------------------fim----------------------------');
  }

  Future<String> convertXmlToJsonCor(String nomeDoArquivoXml) async {
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

  int totalCores = 0;
  int element = 0;
  List<Cor> convertJsonToCor(String jsonString) {
    //* Converte para Map
    Map<String, dynamic> mapCores = jsonDecode(jsonString);

    totalCores = mapCores['DataSet']['Row'].length;

    print('total de Cores no arquivo .xml--> $totalCores');

    //* Cria um List dos Maps
    List corListMap = [];

    for (var elemento = 0; elemento < totalCores; elemento++) {
      corListMap.add((mapCores['DataSet']['Row'][elemento]));
      element++;
      totalCores;
      update();
    }

    print('Coreslistmap  sincronizacao_page--> $corListMap');
    final List<Cor> corListaObjeto = List<Cor>.from(
      corListMap.map((model) => Cor.fromMap(model)),
    );

    return corListaObjeto;
  }

  Future<int> apagaTodasAsCores() async {
    int resultado = await corDao.deleteAll();
    return resultado;
  }

//! FIM COR
// ==================================================================================================

//! INICIO DISPOSITIVO
  DispositivoDao dispositivoDao = DispositivoDao();
  Dispositivo dispositivo = Dispositivo();
  // int resposta = 0;

  sincronizacaoDispositivo(BuildContext context) async {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO DISPOSITIVO');
    // Apaga todos os dados da tabela de dispositivo
    await dispositivoDao.deleteAll();
    print('delete dispositivo');
    // await conexaoFTP('Dispositivo');
    print('conexaoFTP');
    String jsonStringDispositivo = await convertXmlToJsonDispositivo(
        'Dispositivo'); //convertendo XML em Json
    print('json');
    Dispositivo dispositivoObjeto =
        convertJsonToDispositivo(jsonStringDispositivo);
    print('dispositivoObjeto--> $dispositivoObjeto');

    dispositivoDao.salvar(dispositivoObjeto);
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM DISPOSITIVO');
  }

  Future<String> convertXmlToJsonDispositivo(String nomeDoArquivoXml) async {
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

  int totalDispositivo = 0;
  int elementDispositivo = 0;

  Dispositivo convertJsonToDispositivo(String jsonString) {
    //* Converte para Map
    Map<String, dynamic> mapDispositivo = jsonDecode(jsonString);

    print(mapDispositivo['DataSet']['Row']);

    Dispositivo dispositivoObjeto =
        Dispositivo.fromMap(mapDispositivo['DataSet']['Row']);

    totalDispositivo = 1;
    elementDispositivo = 1;
    update();

    return dispositivoObjeto;
  }

  Future<Dispositivo> buscarDispositivo() async {
    dispositivo = await dispositivoDao.find();
    return dispositivo;
  }

  Future<int> alterarDispositivo() async {
    int resultadoDispositivo = await dispositivoDao.update();
    return resultadoDispositivo;
  }

  Future<int> apagaTodosOsDispositivos() async {
    int resultado = await dispositivoDao.deleteAll();
    return resultado;
  }

//! FIM DISPOSITIVO

//! INICIO CLIENTES
  //! >>>>>>>>  INICIO DO CLIENTE  <<<<<<<<<
  ClientesDao clientesDao = ClientesDao();

  int respostaCliente = 0;

  bool erro = false;

  //* INICIO ATUALIZACAO DE CLIENTES

  sincronizacaoClientes(BuildContext context) async {
    //!  Conectando e baixando o arquivo Cliente.xml
    erro = false;
    // await conexaoFTP('Cliente');
    //convertendo XML em Json

    String jsonStringCliente = '';
    if (!erro) {
      jsonStringCliente = await convertXmlToJson('Cliente');
    }
    List<Cliente>? clienteListaObjeto;
    if (!erro) {
      clienteListaObjeto = convertJsonToCliente(
          jsonStringCliente); //convertendo Json em uma lista de Objetos(Cliente)
    }

    if (!erro) {
      await mapeandoClientesParaSalvarOuAlterar(
          clienteListaObjeto!); // importando novos ou alterando clientes
    }

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM CLIENTES');
    // SincronizacaoAtualizacaoMensagem();
  }

  Future<String> convertXmlToJson(String nomeDoArquivoXml) async {
    try {
//todo  Lançando uma exceção

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
    } catch (e) {
      print('CATCH =====================================================');
      print('erro--> $e');

      Fluttertoast.showToast(
        msg: "ERRO INESPERADO!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      erro = true;
      print('FIM CATCH =====================================================');
    }
    return '';
  }

  int totalClientes = 0;
  // int element = 0;
  List<Cliente> convertJsonToCliente(String jsonString) {
    try {
      //* Converte para Map
      Map<String, dynamic> mapCLientes = jsonDecode(jsonString);

      totalClientes = mapCLientes['DataSet']['Row'].length;
      print('total de clientes no arquivo .xml--> $totalClientes');

      //* Cria um List dos Maps
      List clientesListMap = [];
      int elemento = 0;
      for (elemento = 0; elemento < totalClientes; elemento++) {
        clientesListMap.add((mapCLientes['DataSet']['Row'][elemento]));
      }

      print('Clienteslistmap  sincronizacao_page--> $clientesListMap');
      final List<Cliente> clienteListaObjeto = List<Cliente>.from(
        clientesListMap.map((model) => Cliente.fromMap(model, false)),
      );

      return clienteListaObjeto;
    } catch (e) {
      Fluttertoast.showToast(
        msg: "ERRO INESPERADO!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      erro = true;
    }
    return [];
  }

  //*

  mapeandoClientesParaSalvarOuAlterar(List<Cliente> clienteListaObjeto) async {
    try {
      int inclusos = 0;
      int alterados = 0;

      for (var elemento in clienteListaObjeto) {
        print('elemento N.Fantasia ==> ${elemento.nomeFantasia}');
        print('elemento ClienteIdInt==> ${elemento.clienteIdInt}');
        int respostaCliente = await salvarOuAlterarClientes(elemento);
        // print('respostaCliente_PAGE--> $respostaCliente');
        if (respostaCliente == 0) {
          alterados++;
        } else {
          inclusos++;
        }
        // todo atualização da contagem
        element++;
        totalClientes;
        update();
        // //! int respostaCliente = await clientesDao.salvar(novoCliente);
        // print('respostaCliente --> $respostaCliente');
        print('====-----====');
      }

      print(
          'Total de Clientes Lidos do arquivo .xml--> ${clienteListaObjeto.length}');
      print('Total de Clientes Alterados--> $alterados');
      print('Total de Clientes Inclusos--> $inclusos');
      print('--------------------fim----------------------------');
    } catch (e) {
      Fluttertoast.showToast(
        msg: "ERRO INESPERADO!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      erro = true;
    }
  }

  Future<int> salvarOuAlterarClientes(Cliente clienteDoXml) async {
    try {
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
            '>>>>>>>>>>>>>>>>>>>--respostaFindClientes clienteIdInt-- ${respostaFindClientes.elementAt(0).clienteIdInt}');
        if (clienteDoXml.cNPJCPF != "NAO TEM") {
          print('---- INICIO ALTERANDO CLIENTE-----');
          print('id--> ${clienteDoXml.clienteId}');
          print('Razao--> ${clienteDoXml.razaoSocial}');
          print('N.Fantasia--> ${clienteDoXml.nomeFantasia}');
          // clienteDoXml.clienteIdInt = respostaFindClientes.elementAt(0).clienteIdInt;
          Cliente clienteAlterado = Cliente();
          clienteAlterado.clienteId =
              respostaFindClientes.elementAt(0).clienteId;
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
    } catch (e) {
      Fluttertoast.showToast(
        msg: "ERRO INESPERADO!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      erro = true;
    }
    return 0;
  }

  Future<int> salvarCliente(Cliente cliente) async {
    int resultado = await clientesDao.salvar(cliente);
    return resultado;
  }

  Future<int> apagaTodosOsClientes() async {
    int resultado = await clientesDao.deleteAll();
    return resultado;
  }
//! FIM CLIENTES

//! INICIO GRUPO
//todo

  GrupoDao grupoDao = GrupoDao();
  Grupo grupo = Grupo();
  int respostaGrupo = 0;

  sincronizacaoGrupo(BuildContext context) async {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO GRUPO');
    // Apaga todos os Grupos
    apagaTodosOsGrupos();

    String jsonStringGrupo =
        await convertXmlToJsonGrupo('Grupo'); //convertendo XML em Json

    List<Grupo> grupoListaObjeto = convertJsonToGrupo(
        jsonStringGrupo); //convertendo Json em uma lista de Objetos(Cor)

    await salvarListaDeGrupo(grupoListaObjeto);

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM GRUPO');
  }
//TODO SALVAR OS GRUPOS

  int qtdGrupos = 0;
  salvarListaDeGrupo(List<Grupo> grupoListaObjeto) async {
    print('primeiro grupo da lista de objetos');
    print(grupoListaObjeto[0]);
    print('fim grupo da lista de objetos');

    for (var elemento in grupoListaObjeto) {
      print('elemento GrupoIdInt==> ${elemento.grupoIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
      respostaGrupo = await grupoDao.salvar(elemento);
      if (respostaGrupo != 0) {
        qtdGrupos++;
      }
      print('====-----====');
    }
    print(
        'Total de Grupos Lidos do arquivo .xml--> ${grupoListaObjeto.length}');
    print('Total de Grupos Inclusos--> $qtdGrupos');
    print('--------------------fim----------------------------');
  }

  Future<String> convertXmlToJsonGrupo(String nomeDoArquivoXml) async {
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
    final jsonStringGrupo = xml2json.toParkerWithAttrs();
    print('jsonStringGrupo --> $jsonStringGrupo');

    return jsonStringGrupo;
  }

  int totalGrupos = 0;
  int elementGrupo = 0;
  List<Grupo> convertJsonToGrupo(String jsonStringGrupo) {
    //* Converte para Map
    Map<String, dynamic> mapGrupos = jsonDecode(jsonStringGrupo);

    totalGrupos = mapGrupos['DataSet']['Row'].length;

    print('total de Cores no arquivo .xml--> $totalGrupos');

    //* Cria um List dos Maps
    List grupoListMap = [];

    for (var elemento = 0; elemento < totalGrupos; elemento++) {
      grupoListMap.add((mapGrupos['DataSet']['Row'][elemento]));
      elementGrupo++;
      totalGrupos;
      update();
    }

    print('Grupolistmap  sincronizacao_page--> $grupoListMap');
    final List<Grupo> grupoListaObjeto = List<Grupo>.from(
      grupoListMap.map((model) => Grupo.fromMap(model)),
    );

    return grupoListaObjeto;
  }

  Future<int> apagaTodosOsGrupos() async {
    int resultado = await grupoDao.deleteAll();
    return resultado;
  }

//! FIM GRUPO
}


//TODO  CONTEUDO DO ARQUIVO GRUPO.XML ABAIXO

// <DataSet>
//   <Row>
//     <GrupoID_Int>01</GrupoID_Int>
//     <Descricao>Pingente</Descricao>
//   </Row>
//   <Row>
//     <GrupoID_Int>07</GrupoID_Int>
//     <Descricao>Peca Grande</Descricao>
//   </Row>
//   <Row>
//     <GrupoID_Int>02</GrupoID_Int>
//     <Descricao>Brinco</Descricao>
//   </Row>
//   <Row>
//     <GrupoID_Int>03</GrupoID_Int>
//     <Descricao>Anel</Descricao>
//   </Row>
//   <Row>
//     <GrupoID_Int>06</GrupoID_Int>
//     <Descricao>Pulseiras e Gargantilhas</Descricao>
//   </Row>
//   <Row>
//     <GrupoID_Int>04</GrupoID_Int>
//     <Descricao>Corrente</Descricao>
//   </Row>
//   <Row>
//     <GrupoID_Int>09</GrupoID_Int>
//     <Descricao>N. Brinco Corr</Descricao>
//   </Row>
// </DataSet>

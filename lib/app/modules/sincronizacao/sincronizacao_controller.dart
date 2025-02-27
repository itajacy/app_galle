import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:galle/app/models/material_do_produto.dart';
import 'package:galle/app/services/database/dao/cor_dao.dart';
import 'package:galle/app/services/database/dao/linha_dao.dart';
import 'package:get/get.dart';
import 'package:xml2json/xml2json.dart';

import '../../models/cliente.dart';
import '../../models/cor.dart';
import '../../models/dispositivo.dart';
import '../../models/grupo.dart';
import '../../models/linha.dart';
import '../../models/tabela.dart';
import '../../models/tamanho.dart';
import '../../models/tipo.dart';
import '../../services/database/dao/clientes_dao.dart';
import '../../services/database/dao/dispositivo_dao.dart';
import '../../services/database/dao/grupo_dao.dart';
import '../../services/database/dao/material_dao.dart';
import '../../services/database/dao/tabela_dao.dart';
import '../../services/database/dao/tamanho_dao.dart';
import '../../services/database/dao/tipo_dao.dart';
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
      // int resposta = await corDao.salvar(elemento);
      int resposta = await salvarCor(elemento);
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

  Future<int> salvarCor(Cor cor) async {
    int resultado = await corDao.salvar(cor);
    return resultado;
  }

  Future<int> apagaTodasAsCores() async {
    int resultado = await corDao.deleteAll();
    return resultado;
  }

//! FIM COR

//! ===========================================================================

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

    // dispositivoDao.salvar(dispositivoObjeto);
    salvarDispositivo(dispositivoObjeto);
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

  Future<int> salvarDispositivo(Dispositivo dispositivo) async {
    int resultado = await dispositivoDao.salvar(dispositivo);
    return resultado;
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

//! ===========================================================================

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

//! ===========================================================================

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
      // respostaGrupo = await grupoDao.salvar(elemento);
      respostaGrupo = await salvarGrupo(elemento);
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

    print('total de Grupos no arquivo .xml--> $totalGrupos');

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

  Future<int> salvarGrupo(Grupo grupo) async {
    int resultado = await grupoDao.salvar(grupo);
    return resultado;
  }

  Future<int> apagaTodosOsGrupos() async {
    int resultado = await grupoDao.deleteAll();
    return resultado;
  }

//! FIM GRUPO

//! ===========================================================================

//! INICIO  LINHA

  LinhaDao linhaDao = LinhaDao();
  Linha linha = Linha();
  int respostaLinha = 0;

  sincronizacaoLinha(BuildContext context) async {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO Linha');
    // Apaga todos os Linhas
    apagaTodasAsLinhas();

    String jsonStringLinha =
        await convertXmlToJsonLinha('Linha'); //convertendo XML em Json

    List<Linha> linhaListaObjeto = convertJsonToLinha(
        jsonStringLinha); //convertendo Json em uma lista de Objetos(Linha)

    await salvarListaDeLinha(linhaListaObjeto);

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM Linha');
  }
//TODO SALVAR AS LINHAS

  int qtdLinhas = 0;
  salvarListaDeLinha(List<Linha> linhaListaObjeto) async {
    print('primeira linha da lista de objetos');
    print(linhaListaObjeto[0]);
    print('fim grupo da lista de objetos');

    for (var elemento in linhaListaObjeto) {
      print('elemento LinhaIdInt==> ${elemento.linhaIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
      // respostaLinha = await linhaDao.salvar(elemento);
      respostaLinha = await salvarLinha(elemento);
      if (respostaLinha != 0) {
        qtdLinhas++;
      }
      print('====-----====');
    }
    print(
        'Total de Linhas Lidos do arquivo .xml--> ${linhaListaObjeto.length}');
    print('Total de Linhas Inclusos--> $qtdLinhas');
    print('--------------------fim----------------------------');
  }

  Future<String> convertXmlToJsonLinha(String nomeDoArquivoXml) async {
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
    final jsonStringLinha = xml2json.toParkerWithAttrs();
    print('jsonStringLinha --> $jsonStringLinha');

    return jsonStringLinha;
  }

  int totalLinhas = 0;
  int elementLinha = 0;
  List<Linha> convertJsonToLinha(String jsonStringLinha) {
    //* Converte para Map
    Map<String, dynamic> mapLinhas = jsonDecode(jsonStringLinha);

    totalLinhas = mapLinhas['DataSet']['Row'].length;

    print('total de Linhas no arquivo .xml--> $totalLinhas');

    //* Cria um List dos Maps
    List linhaListMap = [];

    for (var elemento = 0; elemento < totalLinhas; elemento++) {
      linhaListMap.add((mapLinhas['DataSet']['Row'][elemento]));
      elementLinha++;
      totalLinhas;
      update();
    }

    print('Linhalistmap  sincronizacao_page--> $linhaListMap');
    final List<Linha> linhaListaObjeto = List<Linha>.from(
      linhaListMap.map((model) => Linha.fromMap(model)),
    );

    return linhaListaObjeto;
  }

  Future<int> salvarLinha(Linha linha) async {
    int resultado = await linhaDao.salvar(linha);
    return resultado;
  }

  Future<int> apagaTodasAsLinhas() async {
    int resultado = await linhaDao.deleteAll();
    return resultado;
  }

//! FIM  LINHA

//! ===========================================================================

//! INICIO  TIPO

  TipoDao tipoDao = TipoDao();
  Tipo tipo = Tipo();
  int respostaTipo = 0;

  sincronizacaoTipo(BuildContext context) async {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO Tipo');
    // Apaga todos os Tipos
    apagaTodosOsTipos();

    String jsonStringTipo =
        await convertXmlToJsonTipo('Tipo'); //convertendo XML em Json

    List<Tipo> tipoListaObjeto = convertJsonToTipo(
        jsonStringTipo); //convertendo Json em uma lista de Objetos(Tipo)

    await salvarListaDeTipo(tipoListaObjeto);

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM Tipo');
  }
//TODO SALVAR AS LINHAS

  int qtdTipos = 0;
  salvarListaDeTipo(List<Tipo> tipoListaObjeto) async {
    print('primeira tipo da lista de objetos');
    print(tipoListaObjeto[0]);
    print('fim grupo da lista de objetos');

    for (var elemento in tipoListaObjeto) {
      print('elemento TipoIdInt==> ${elemento.tipoIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
      // respostaTipo = await tipoDao.salvar(elemento);
      respostaTipo = await salvarTipo(elemento);
      if (respostaTipo != 0) {
        qtdTipos++;
      }
      print('====-----====');
    }
    print('Total de Tipos Lidos do arquivo .xml--> ${tipoListaObjeto.length}');
    print('Total de Tipos Inclusos--> $qtdTipos');
    print('--------------------fim----------------------------');
  }

  Future<String> convertXmlToJsonTipo(String nomeDoArquivoXml) async {
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
    final jsonStringTipo = xml2json.toParkerWithAttrs();
    print('jsonStringTipo --> $jsonStringTipo');

    return jsonStringTipo;
  }

  int totalTipos = 0;
  int elementTipo = 0;
  List<Tipo> convertJsonToTipo(String jsonStringTipo) {
    //* Converte para Map
    Map<String, dynamic> mapTipos = jsonDecode(jsonStringTipo);

    totalTipos = mapTipos['DataSet']['Row'].length;

    print('total de Tipos no arquivo .xml--> $totalTipos');

    //* Cria um List dos Maps
    List tipoListMap = [];

    for (var elemento = 0; elemento < totalTipos; elemento++) {
      tipoListMap.add((mapTipos['DataSet']['Row'][elemento]));
      elementTipo++;
      totalTipos;
      update();
    }

    print('Tipolistmap  sincronizacao_page--> $tipoListMap');
    final List<Tipo> tipoListaObjeto = List<Tipo>.from(
      tipoListMap.map((model) => Tipo.fromMap(model)),
    );

    return tipoListaObjeto;
  }

  Future<int> salvarTipo(Tipo tipo) async {
    int resultado = await tipoDao.salvar(tipo);
    return resultado;
  }

//*
  Future<int> apagaTodosOsTipos() async {
    int resultado = await tipoDao.deleteAll();
    return resultado;
  }

//! FIM  TIPO

//! ===========================================================================

//! INICIO  TAMANHO

  TamanhoDao tamanhoDao = TamanhoDao();
  Tamanho tamanho = Tamanho();
  int respostaTamanho = 0;

  sincronizacaoTamanho(BuildContext context) async {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO Tamanho');
    // Apaga todos os Tamanhos
    apagaTodosOsTamanhos();

    String jsonStringTamanho =
        await convertXmlToJsonTamanho('Tamanho'); //convertendo XML em Json

    List<Tamanho> tamanhoListaObjeto = convertJsonToTamanho(
        jsonStringTamanho); //convertendo Json em uma lista de Objetos(Tamanho)

    await salvarListaDeTamanho(tamanhoListaObjeto);

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM Tamanho');
  }
//TODO SALVAR AS LINHAS

  int qtdTamanhos = 0;
  salvarListaDeTamanho(List<Tamanho> tamanhoListaObjeto) async {
    print('primeira tamanho da lista de objetos');
    print(tamanhoListaObjeto[0]);
    print('fim grupo da lista de objetos');

    for (var elemento in tamanhoListaObjeto) {
      print('elemento TamanhoIdInt==> ${elemento.tamanhoIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
      // respostaTamanho = await tamanhoDao.salvar(elemento);
      respostaTamanho = await salvarTamanho(elemento);
      if (respostaTamanho != 0) {
        qtdTamanhos++;
      }
      print('====-----====');
    }
    print(
        'Total de Tamanhos Lidos do arquivo .xml--> ${tamanhoListaObjeto.length}');
    print('Total de Tamanhos Inclusos--> $qtdTamanhos');
    print('--------------------fim----------------------------');
  }

  Future<String> convertXmlToJsonTamanho(String nomeDoArquivoXml) async {
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
    final jsonStringTamanho = xml2json.toParkerWithAttrs();
    print('jsonStringTamanho --> $jsonStringTamanho');

    return jsonStringTamanho;
  }

  int totalTamanhos = 0;
  int elementTamanho = 0;
  List<Tamanho> convertJsonToTamanho(String jsonStringTamanho) {
    //* Converte para Map
    Map<String, dynamic> mapTamanhos = jsonDecode(jsonStringTamanho);

    totalTamanhos = mapTamanhos['DataSet']['Row'].length;

    print('total de Tamanhos no arquivo .xml--> $totalTamanhos');

    //* Cria um List dos Maps
    List tamanhoListMap = [];

    for (var elemento = 0; elemento < totalTamanhos; elemento++) {
      tamanhoListMap.add((mapTamanhos['DataSet']['Row'][elemento]));
      elementTamanho++;
      totalTamanhos;
      update();
    }

    print('Tamanholistmap  sincronizacao_page--> $tamanhoListMap');
    final List<Tamanho> tamanhoListaObjeto = List<Tamanho>.from(
      tamanhoListMap.map((model) => Tamanho.fromMap(model)),
    );

    return tamanhoListaObjeto;
  }

  Future<int> salvarTamanho(Tamanho tamanho) async {
    int resultado = await tamanhoDao.salvar(tamanho);
    return resultado;
  }

//*
  Future<int> apagaTodosOsTamanhos() async {
    int resultado = await tamanhoDao.deleteAll();
    return resultado;
  }

//! FIM  TAMANHO

//! ===========================================================================

//! INICIO TABELA

  TabelaDao tabelaDao = TabelaDao();
  Tabela tabela = Tabela();
  int respostaTabela = 0;

  sincronizacaoTabela(BuildContext context) async {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO Tabela');
    // Apaga todos os Tabelas
    apagaTodasAsTabelas();

    String jsonStringTabela =
        await convertXmlToJsonTabela('Tabela'); //convertendo XML em Json

    List<Tabela> tabelaListaObjeto = convertJsonToTabela(
        jsonStringTabela); //convertendo Json em uma lista de Objetos(Tabela)

    await salvarListaDeTabela(tabelaListaObjeto);

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM Tabela');
  }
//TODO SALVAR AS LINHAS

  int qtdTabelas = 0;
  salvarListaDeTabela(List<Tabela> tabelaListaObjeto) async {
    print('primeira tabela da lista de objetos');
    print(tabelaListaObjeto[0]);
    print('fim grupo da lista de objetos');

    for (var elemento in tabelaListaObjeto) {
      print('elemento TabelaIdInt==> ${elemento.tabelaIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
      // respostaTabela = await tabelaDao.salvar(elemento);
      respostaTabela = await salvarTabela(elemento);
      if (respostaTabela != 0) {
        qtdTabelas++;
      }
      print('====-----====');
    }
    print(
        'Total de Tabelas Lidos do arquivo .xml--> ${tabelaListaObjeto.length}');
    print('Total de Tabelas Inclusos--> $qtdTabelas');
    print('--------------------fim----------------------------');
  }

  Future<String> convertXmlToJsonTabela(String nomeDoArquivoXml) async {
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
    final jsonStringTabela = xml2json.toParkerWithAttrs();
    print('jsonStringTabela --> $jsonStringTabela');

    return jsonStringTabela;
  }

  int totalTabelas = 0;
  int elementTabela = 0;
  List<Tabela> convertJsonToTabela(String jsonStringTabela) {
    //* Converte para Map
    Map<String, dynamic> mapTabelas = jsonDecode(jsonStringTabela);

    totalTabelas = mapTabelas['DataSet']['Row'].length;

    print('total de Tabelas no arquivo .xml--> $totalTabelas');

    //* Cria um List dos Maps
    List tabelaListMap = [];

    for (var elemento = 0; elemento < totalTabelas; elemento++) {
      tabelaListMap.add((mapTabelas['DataSet']['Row'][elemento]));
      elementTabela++;
      totalTabelas;
      update();
    }

    print('Tabelalistmap  sincronizacao_page--> $tabelaListMap');
    final List<Tabela> tabelaListaObjeto = List<Tabela>.from(
      tabelaListMap.map((model) => Tabela.fromMap(model)),
    );

    return tabelaListaObjeto;
  }

  Future<int> salvarTabela(Tabela tabela) async {
    int resultado = await tabelaDao.salvar(tabela);
    return resultado;
  }

//*

  Future<int> apagaTodasAsTabelas() async {
    int resultado = await tabelaDao.deleteAll();
    return resultado;
  }

//! FIM TABELA

//! ===========================================================================

//! INICIO MATERIAL

  MaterialDao materialDao = MaterialDao();

  MaterialDoProduto material = MaterialDoProduto();
  int respostaMaterial = 0;

  sincronizacaoMaterial(BuildContext context) async {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO Material');
    // Apaga todos os Materials
    apagaTodosOsMateriais();

    String jsonStringMaterial =
        await convertXmlToJsonMaterial('Material'); //convertendo XML em Json

    List<MaterialDoProduto> materialListaObjeto = convertJsonToMaterial(
        jsonStringMaterial); //convertendo Json em uma lista de Objetos(Material)

    await salvarListaDeMaterial(materialListaObjeto);

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM Material');
  }
//TODO SALVAR AS LINHAS

  int qtdMaterials = 0;
  salvarListaDeMaterial(List<MaterialDoProduto> materialListaObjeto) async {
    print('primeira material da lista de objetos');
    print(materialListaObjeto[0]);
    print('fim grupo da lista de objetos');

    for (var elemento in materialListaObjeto) {
      print('elemento MaterialIdInt==> ${elemento.materialIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
      // respostaMaterial = await materialDao.salvar(elemento);
      respostaMaterial = await salvarMaterial(elemento);
      if (respostaMaterial != 0) {
        qtdMaterials++;
      }
      print('====-----====');
    }
    print(
        'Total de Materials Lidos do arquivo .xml--> ${materialListaObjeto.length}');
    print('Total de Materials Inclusos--> $qtdMaterials');
    print('--------------------fim----------------------------');
  }

  Future<String> convertXmlToJsonMaterial(String nomeDoArquivoXml) async {
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
    final jsonStringMaterial = xml2json.toParkerWithAttrs();
    print('jsonStringMaterial --> $jsonStringMaterial');

    return jsonStringMaterial;
  }

  int totalMaterials = 0;
  int elementMaterial = 0;
  List<MaterialDoProduto> convertJsonToMaterial(String jsonStringMaterial) {
    //* Converte para Map
    Map<String, dynamic> mapMaterials = jsonDecode(jsonStringMaterial);

    totalMaterials = mapMaterials['DataSet']['Row'].length;

    print('total de Materials no arquivo .xml--> $totalMaterials');

    //* Cria um List dos Maps
    List materialListMap = [];

    for (var elemento = 0; elemento < totalMaterials; elemento++) {
      materialListMap.add((mapMaterials['DataSet']['Row'][elemento]));
      elementMaterial++;
      totalMaterials;
      update();
    }

    print('MaterialListmap  sincronizacao_page--> $materialListMap');
    final List<MaterialDoProduto> materialListaObjeto =
        List<MaterialDoProduto>.from(
      materialListMap.map((model) => MaterialDoProduto.fromMap(model)),
    );

    return materialListaObjeto;
  }

  Future<int> salvarMaterial(MaterialDoProduto material) async {
    int resultado = await materialDao.salvar(material);
    return resultado;
  }

//*
  Future<int> apagaTodosOsMateriais() async {
    int resultado = await materialDao.deleteAll();
    return resultado;
  }

//! FIM MATERIAL

//* FIM DA SINCRONIZACAOCONTROLLER
}

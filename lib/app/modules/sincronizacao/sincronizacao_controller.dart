import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
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
import '../../models/imagem.dart';
import '../../models/linha.dart';
import '../../models/preco.dart';
import '../../models/produto.dart';
import '../../models/tabela.dart';
import '../../models/tamanho.dart';
import '../../models/tipo.dart';
import '../../services/database/dao/clientes_dao.dart';
import '../../services/database/dao/dispositivo_dao.dart';
import '../../services/database/dao/grupo_dao.dart';
import '../../services/database/dao/imagem_dao.dart';
import '../../services/database/dao/material_dao.dart';
import '../../services/database/dao/preco_dao.dart';
import '../../services/database/dao/produto_dao.dart';
import '../../services/database/dao/tabela_dao.dart';
import '../../services/database/dao/tamanho_dao.dart';
import '../../services/database/dao/tipo_dao.dart';
import '../configuracao/widgets/directory_path.dart';

class SincronizacaoController extends GetxController {
  bool erroGeral = false;

//! INICIO COR

  CorDao corDao = CorDao();
  Cor cor = Cor();
  int resposta = 0;

  sincronizacaoCor(BuildContext context) async {
    erroGeral = false;

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO COR');

    await apagaTodasAsCores();

    String jsonString = '';
    if (!erroGeral) {
      jsonString = await convertXmlToJson('Cor');
    }

    List<Cor> corListaObjeto = [];
    if (!erroGeral) {
      corListaObjeto = convertJsonToCor(jsonString);
    }

    if (!erroGeral) {
      await salvarListaDeCor(corListaObjeto);
    }

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM COR');
  }

  int totalCores = 0;
  int element = 0;
  List<Cor> convertJsonToCor(String jsonString) {
    try {
      Map<String, dynamic> mapCores = jsonDecode(jsonString);

      totalCores = mapCores['DataSet']['Row'].length;

      print('total de Cores no arquivo .xml--> $totalCores');

      List corListMap = [];

      for (var elemento = 0; elemento < totalCores; elemento++) {
        corListMap.add((mapCores['DataSet']['Row'][elemento]));
        element++;
        totalCores;
        update();
      }

      final List<Cor> corListaObjeto = List<Cor>.from(
        corListMap.map((model) => Cor.fromMap(model)),
      );

      return corListaObjeto;
    } catch (e) {
      messageToast("ERRO INESPERADO!(Cor)");

      erroGeral = true;
    }
    return [];
  }

  int qtdCores = 0;
  salvarListaDeCor(List<Cor> corListaObjeto) async {
    for (var elemento in corListaObjeto) {
      print('elemento CorIdInt==> ${elemento.corIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
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

  sincronizacaoDispositivo(BuildContext context) async {
    erroGeral = false;

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO DISPOSITIVO');

    await apagaTodosOsDispositivos();

    String jsonString = '';
    if (!erroGeral) {
      jsonString = await convertXmlToJson('Dispositivo');
    }

    Dispositivo dispositivoObjeto = Dispositivo();
    if (!erroGeral) {
      dispositivoObjeto = convertJsonToDispositivo(jsonString);
    }
    print('dispositivoObjeto--> $dispositivoObjeto');

    if (!erroGeral) {
      salvarDispositivo(dispositivoObjeto);
    }
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM DISPOSITIVO');
  }

  int totalDispositivo = 0;
  int elementDispositivo = 0;

  Dispositivo convertJsonToDispositivo(String jsonString) {
    try {
      Map<String, dynamic> mapDispositivo = jsonDecode(jsonString);

      print(mapDispositivo['DataSet']['Row']);

      Dispositivo dispositivoObjeto =
          Dispositivo.fromMap(mapDispositivo['DataSet']['Row']);

      totalDispositivo = 1;
      elementDispositivo = 1;
      update();

      return dispositivoObjeto;
    } catch (e) {
      messageToast("ERRO INESPERADO!(Dispositivo)");

      erroGeral = true;
    }
    return Dispositivo();
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

  //* INICIO ATUALIZACAO DE CLIENTES

  sincronizacaoClientes(BuildContext context) async {
    erroGeral = false;

    String jsonString = '';
    if (!erroGeral) {
      jsonString = await convertXmlToJson('Cliente');
    }

    List<Cliente>? clienteListaObjeto;
    if (!erroGeral) {
      clienteListaObjeto = convertJsonToCliente(jsonString);
    }

    if (!erroGeral) {
      await mapeandoClientesParaSalvarOuAlterar(clienteListaObjeto!);
    }

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM CLIENTES');
  }

  int totalClientes = 0;

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

      final List<Cliente> clienteListaObjeto = List<Cliente>.from(
        clientesListMap.map((model) => Cliente.fromMap(model, false)),
      );

      return clienteListaObjeto;
    } catch (e) {
      messageToast("ERRO INESPERADO!(Clientes)");

      erroGeral = true;
    }
    return [];
  }

  mapeandoClientesParaSalvarOuAlterar(List<Cliente> clienteListaObjeto) async {
    try {
      int elementCliente = 0;
      int inclusos = 0;
      int alterados = 0;

      for (var elemento in clienteListaObjeto) {
        print('elemento N.Fantasia ==> ${elemento.nomeFantasia}');
        print('elemento ClienteIdInt==> ${elemento.clienteIdInt}');
        int respostaCliente = await salvarOuAlterarClientes(elemento);
        print('RESPOSTA_PAGE-----> $respostaCliente');
        if (respostaCliente == 1) {
          alterados++;
        } else {
          inclusos++;
        }
        // todo atualização da contagem
        elementCliente++;
        totalClientes;
        update();
        print('====---$elementCliente / $totalClientes--====');
      }

      print(
          'Total de Clientes Lidos do arquivo .xml--> ${clienteListaObjeto.length}');
      print('Total de Clientes Alterados--> $alterados');
      print('Total de Clientes Inclusos--> $inclusos');
      print('--------------------fim----------------------------');
    } catch (e) {
      messageToast("ERRO INESPERADO!(Clientes)");

      erroGeral = true;
    }
  }

  Future<int> salvarOuAlterarClientes(Cliente clienteDoXml) async {
    try {
      // List<Cliente> respostaFindClientes =
      //     await clientesDao.findClientes(clienteDoXml.cNPJCPF!);
      List<Cliente> respostaFindClientes =
          await pesquisarCliente(clienteDoXml.cNPJCPF!);

      // print(
      //     'lista de clientes do salvarOuAlterarClientes--> $respostaFindClientes');
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

          // resposta =
          //     await clientesDao.alterar(clienteAlterado);
          resposta = await alterarCliente(clienteAlterado);
          print('---- FIM ALTERANDO CLIENTE-----');
        }
        print('resposta--> $resposta');
        // print('ClienteId  alterado--> ${clienteAlterado.clienteId}');
      } else {
        //se a lista for vazia salva o cliente, pq ele não existe na tabela
        // resposta = await clientesDao.salvar(clienteDoXml);
        resposta = await salvarCliente(clienteDoXml);
        print('resposta--> $resposta');
        print('ClienteId  novo--> ${clienteDoXml.clienteId}');
      }
      print('----------------============================---------------');
      return resposta;
    } catch (e) {
      messageToast("ERRO INESPERADO!(Clientes)");

      erroGeral = true;
    }
    return 0;
  }

  Future<int> salvarCliente(Cliente cliente) async {
    int resultado = await clientesDao.salvar(cliente);
    return resultado;
  }

  Future<int> alterarCliente(Cliente cliente) async {
    int resultado = await clientesDao.alterar(cliente);
    return resultado;
  }

  Future<List<Cliente>> pesquisarCliente(String dadoDoCliente) async {
    List<Cliente> listaDeClientes =
        await clientesDao.findClientes(dadoDoCliente);
    return listaDeClientes;
  }

  Future<int> apagaTodosOsClientes() async {
    int resultado = await clientesDao.deleteAll();
    return resultado;
  }
//! FIM CLIENTES

//! ===========================================================================

//! INICIO GRUPO

  GrupoDao grupoDao = GrupoDao();
  Grupo grupo = Grupo();
  int respostaGrupo = 0;

  sincronizacaoGrupo(BuildContext context) async {
    erroGeral = false;
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO GRUPO');
    apagaTodosOsGrupos();

    String jsonString = '';
    if (!erroGeral) {
      jsonString = await convertXmlToJson('Grupo');
    }

    List<Grupo> grupoListaObjeto = [];
    if (!erroGeral) {
      grupoListaObjeto = convertJsonToGrupo(jsonString);
    }

    if (!erroGeral) {
      await salvarListaDeGrupo(grupoListaObjeto);
    }

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM GRUPO');
  }

  int qtdGrupos = 0;
  salvarListaDeGrupo(List<Grupo> grupoListaObjeto) async {
    print('primeiro grupo da lista de objetos');
    print(grupoListaObjeto[0]);
    print('fim grupo da lista de objetos');

    for (var elemento in grupoListaObjeto) {
      print('elemento GrupoIdInt==> ${elemento.grupoIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
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

  int totalGrupos = 0;
  int elementGrupo = 0;
  List<Grupo> convertJsonToGrupo(String jsonStringGrupo) {
    try {
      Map<String, dynamic> mapGrupos = jsonDecode(jsonStringGrupo);

      totalGrupos = mapGrupos['DataSet']['Row'].length;

      print('total de Grupos no arquivo .xml--> $totalGrupos');

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
    } catch (e) {
      messageToast("ERRO INESPERADO!(Grupo)");

      erroGeral = true;
    }
    return [];
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
    erroGeral = false;

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO Linha');
    apagaTodasAsLinhas();

    String jsonString = '';
    if (!erroGeral) {
      jsonString = await convertXmlToJson('Linha');
    }

    List<Linha> linhaListaObjeto = [];
    if (!erroGeral) {
      linhaListaObjeto = convertJsonToLinha(jsonString);
    }

    if (!erroGeral) {
      await salvarListaDeLinha(linhaListaObjeto);
    }

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM Linha');
  }

  int qtdLinhas = 0;
  salvarListaDeLinha(List<Linha> linhaListaObjeto) async {
    for (var elemento in linhaListaObjeto) {
      print('elemento LinhaIdInt==> ${elemento.linhaIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
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

  int totalLinhas = 0;
  int elementLinha = 0;
  List<Linha> convertJsonToLinha(String jsonStringLinha) {
    try {
      Map<String, dynamic> mapLinhas = jsonDecode(jsonStringLinha);

      totalLinhas = mapLinhas['DataSet']['Row'].length;

      print('total de Linhas no arquivo .xml--> $totalLinhas');

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
    } catch (e) {
      messageToast("ERRO INESPERADO!(Linha)");

      erroGeral = true;
    }
    return [];
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
    erroGeral = false;
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO Tipo');
    apagaTodosOsTipos();

    String jsonString = '';
    if (!erroGeral) {
      jsonString = await convertXmlToJson('Tipo');
    }

    List<Tipo> tipoListaObjeto = [];
    if (!erroGeral) {
      tipoListaObjeto = convertJsonToTipo(jsonString);
    }

    if (!erroGeral) {
      await salvarListaDeTipo(tipoListaObjeto);
    }

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM Tipo');
  }

  int qtdTipos = 0;
  salvarListaDeTipo(List<Tipo> tipoListaObjeto) async {
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

  int totalTipos = 0;
  int elementTipo = 0;
  List<Tipo> convertJsonToTipo(String jsonStringTipo) {
    try {
      Map<String, dynamic> mapTipos = jsonDecode(jsonStringTipo);

      totalTipos = mapTipos['DataSet']['Row'].length;

      print('total de Tipos no arquivo .xml--> $totalTipos');

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
    } catch (e) {
      messageToast("ERRO INESPERADO!(Tipo)");

      erroGeral = true;
    }
    return [];
  }

  Future<int> salvarTipo(Tipo tipo) async {
    int resultado = await tipoDao.salvar(tipo);
    return resultado;
  }

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
    erroGeral = false;

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO Tamanho');
    apagaTodosOsTamanhos();

    String jsonString = '';
    if (!erroGeral) {
      jsonString = await convertXmlToJson('Tamanho');
    }

    List<Tamanho> tamanhoListaObjeto = [];
    if (!erroGeral) {
      tamanhoListaObjeto = convertJsonToTamanho(jsonString);
    }

    if (!erroGeral) {
      await salvarListaDeTamanho(tamanhoListaObjeto);
    }

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM Tamanho');
  }

  int qtdTamanhos = 0;
  salvarListaDeTamanho(List<Tamanho> tamanhoListaObjeto) async {
    for (var elemento in tamanhoListaObjeto) {
      print('elemento TamanhoIdInt==> ${elemento.tamanhoIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
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

  int totalTamanhos = 0;
  int elementTamanho = 0;
  List<Tamanho> convertJsonToTamanho(String jsonStringTamanho) {
    try {
      Map<String, dynamic> mapTamanhos = jsonDecode(jsonStringTamanho);

      totalTamanhos = mapTamanhos['DataSet']['Row'].length;

      print('total de Tamanhos no arquivo .xml--> $totalTamanhos');

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
    } catch (e) {
      messageToast("ERRO INESPERADO!(Tamanho)");

      erroGeral = true;
    }
    return [];
  }

  Future<int> salvarTamanho(Tamanho tamanho) async {
    int resultado = await tamanhoDao.salvar(tamanho);
    return resultado;
  }

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
    erroGeral = false;
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO Tabela');
    apagaTodasAsTabelas();

    String jsonString = '';
    if (!erroGeral) {
      jsonString = await convertXmlToJson('Tabela');
    }

    List<Tabela> tabelaListaObjeto = [];
    if (!erroGeral) {
      tabelaListaObjeto = convertJsonToTabela(jsonString);
    }

    if (!erroGeral) {
      await salvarListaDeTabela(tabelaListaObjeto);
    }

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM Tabela');
  }

  int qtdTabelas = 0;
  salvarListaDeTabela(List<Tabela> tabelaListaObjeto) async {
    for (var elemento in tabelaListaObjeto) {
      print('elemento TabelaIdInt==> ${elemento.tabelaIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
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

  int totalTabelas = 0;
  int elementTabela = 0;
  List<Tabela> convertJsonToTabela(String jsonStringTabela) {
    try {
      Map<String, dynamic> mapTabelas = jsonDecode(jsonStringTabela);

      totalTabelas = mapTabelas['DataSet']['Row'].length;

      print('total de Tabelas no arquivo .xml--> $totalTabelas');

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
    } catch (e) {
      messageToast("ERRO INESPERADO!(Tabela)");

      erroGeral = true;
    }
    return [];
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
    erroGeral = false;
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO Material');
    apagaTodosOsMateriais();

    String jsonString = '';
    if (!erroGeral) {
      jsonString = await convertXmlToJson('Material');
    }
    List<MaterialDoProduto> materialListaObjeto = [];
    if (!erroGeral) {
      materialListaObjeto = convertJsonToMaterial(jsonString);
    }
    if (!erroGeral) {
      await salvarListaDeMaterial(materialListaObjeto);
    }

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM Material');
  }

  int qtdMaterials = 0;
  salvarListaDeMaterial(List<MaterialDoProduto> materialListaObjeto) async {
    for (var elemento in materialListaObjeto) {
      print('elemento MaterialIdInt==> ${elemento.materialIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
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

  int totalMaterials = 0;
  int elementMaterial = 0;
  List<MaterialDoProduto> convertJsonToMaterial(String jsonStringMaterial) {
    try {
      Map<String, dynamic> mapMaterials = jsonDecode(jsonStringMaterial);

      totalMaterials = mapMaterials['DataSet']['Row'].length;

      print('total de Materials no arquivo .xml--> $totalMaterials');

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
    } catch (e) {
      messageToast("ERRO INESPERADO!(Material)");

      erroGeral = true;
    }
    return [];
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

//! ===========================================================================

//! INICIO IMAGEM

  ImagemDao imagemDao = ImagemDao();
  Imagem imagem = Imagem();
  int respostaImagem = 0;

  sincronizacaoImagem(BuildContext context) async {
    erroGeral = false;
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO IMAGEM');
    apagaTodasAsImagens();

    String jsonString = '';
    if (!erroGeral) {
      jsonString = await convertXmlToJson('Imagem');
    }

    List<Imagem> imagemListaObjeto = [];
    if (!erroGeral) {
      imagemListaObjeto = convertJsonToImagem(jsonString);
    }
    if (!erroGeral) {
      await salvarListaDeImagem(imagemListaObjeto);
    }

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM IMAGEM');
  }

  int qtdImagens = 0;
  salvarListaDeImagem(List<Imagem> imagemListaObjeto) async {
    for (var elemento in imagemListaObjeto) {
      print('elemento imagemID==> ${elemento.imagemId}');
      print('elemento Timestamp ==> ${elemento.timeStamp}');
      int respostaImagem = await salvarImagem(elemento);
      if (respostaImagem != 0) {
        qtdImagens++;
      }
      print('====-----====');
    }
    print(
        'Total de Imagens Lidos do arquivo Imagem.xml--> ${imagemListaObjeto.length}');
    print('Total de Imagens Inclusas--> $qtdImagens');
    print('--------------------fim----------------------------');
  }

  int totalImagens = 0;
  int elementImagem = 0;
  List<Imagem> convertJsonToImagem(String jsonString) {
    try {
      Map<String, dynamic> mapCores = jsonDecode(jsonString);

      totalImagens = mapCores['DataSet']['Row'].length;

      print('total de Cores no arquivo .xml--> $totalImagens');

      List imagemListMap = [];

      for (var elemento = 0; elemento < totalImagens; elemento++) {
        imagemListMap.add((mapCores['DataSet']['Row'][elemento]));
        elementImagem++;
        totalImagens;
        update();
      }

      print('imagemlistmap  sincronizacao_page--> $imagemListMap');
      final List<Imagem> imagemListaObjeto = List<Imagem>.from(
        imagemListMap.map((model) => Imagem.fromMap(model)),
      );

      return imagemListaObjeto;
    } catch (e) {
      messageToast("ERRO INESPERADO!(Imagem)");

      erroGeral = true;
    }
    return [];
  }

  Future<int> salvarImagem(Imagem imagem) async {
    int resultado = await imagemDao.salvar(imagem);
    return resultado;
  }

  Future<int> apagaTodasAsImagens() async {
    int resultado = await imagemDao.deleteAll();
    return resultado;
  }

//! FIM  IMAGEM

//! ===========================================================================

//! INICIO  PRECO

  PrecoDao precoDao = PrecoDao();
  Preco preco = Preco();
  int respostaPreco = 0;

  sincronizacaoPreco(BuildContext context) async {
    bool erroGeral = false;

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO PRECO');
    apagaTodosOsPrecos();

    String jsonString = '';
    if (!erroGeral) {
      jsonString = await convertXmlToJson('Preco');
    }

    List<Preco> precoListaObjeto = [];
    if (!erroGeral) {
      precoListaObjeto = convertJsonToPreco(jsonString);
    }

    if (!erroGeral) {
      await salvarListaDePreco(precoListaObjeto);
    }

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM PRECO');
    // erroGeral = true;
  }

  int qtdPrecos = 0;
  salvarListaDePreco(List<Preco> precoListaObjeto) async {
    for (var elemento in precoListaObjeto) {
      print('elemento PrecoIdInt==> ${elemento.tabelaId}');
      print('elemento Descricao ==> ${elemento.produtoId}');
      int respostaPreco = await salvarPreco(elemento);
      if (respostaPreco != 0) {
        qtdPrecos++;
      }
      print('====-----====');
    }
    print(
        'Total de Precos Lidos do arquivo Preco.xml--> ${precoListaObjeto.length}');
    print('Total de Precos Inclusas--> $qtdPrecos');
    print('--------------------fim----------------------------');
  }

  int totalPrecos = 0;
  int elementPreco = 0;
  List<Preco> convertJsonToPreco(String jsonString) {
    try {
      Map<String, dynamic> mapPrecos = jsonDecode(jsonString);

      totalPrecos = mapPrecos['DataSet']['Row'].length;

      print('total de Precos no arquivo .xml--> $totalPrecos');

      List precoListMap = [];

      for (var elemento = 0; elemento < totalPrecos; elemento++) {
        precoListMap.add((mapPrecos['DataSet']['Row'][elemento]));
        elementPreco++;
        totalPrecos;
        update();
      }

      print('Precoslistmap  sincronizacao_page--> $precoListMap');
      final List<Preco> precoListaObjeto = List<Preco>.from(
        precoListMap.map((model) => Preco.fromMap(model)),
      );

      return precoListaObjeto;
    } catch (e) {
      messageToast("ERRO INESPERADO!(Preco)");

      erroGeral = true;
    }
    return [];
  }

  Future<int> salvarPreco(Preco preco) async {
    int resultado = await precoDao.salvar(preco);
    return resultado;
  }

  Future<int> apagaTodosOsPrecos() async {
    int resultado = await precoDao.deleteAll();
    return resultado;
  }

//! FIM  PRECO

//! ===========================================================================

//! INICIO  PRODUTO

  ProdutoDao produtoDao = ProdutoDao();
  Produto produto = Produto();
  int respostaProduto = 0;

  sincronizacaoProduto(BuildContext context) async {
    erroGeral = false;
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INICIO PRODUTO');
    // Apaga todas as produtos
    apagaTodosOsProdutos();

    String jsonString = '';
    if (!erroGeral) {
      jsonString = await convertXmlToJson('Produto'); //convertendo XML em Json
    }

    List<Produto> produtoListaObjeto = [];
    if (!erroGeral) {
      produtoListaObjeto = convertJsonToProduto(
          jsonString); //convertendo Json em uma lista de Objetos(Produto)
    }

    if (!erroGeral) {
      await salvarListaDeProduto(produtoListaObjeto);
    }

    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>FIM PRODUTO');
    erroGeral = true;
  }
//TODO SALVAR OS PRODUTOS

  int qtdProdutos = 0;
  salvarListaDeProduto(List<Produto> produtoListaObjeto) async {
    for (var elemento in produtoListaObjeto) {
      print('elemento ProdutoIdInt==> ${elemento.produtoIdInt}');
      print('elemento Descricao ==> ${elemento.descricao}');
      int respostaProduto = await salvarProduto(elemento);
      if (respostaProduto != 0) {
        qtdProdutos++;
      }
      print('====-----====');
    }
    print(
        'Total de Produtos Lidos do arquivo Produto.xml--> ${produtoListaObjeto.length}');
    print('Total de Produtos Inclusas--> $qtdProdutos');
    print('--------------------fim----------------------------');
  }

  int totalProdutos = 0;
  int elementProduto = 0;
  List<Produto> convertJsonToProduto(String jsonString) {
    try {
      //* Converte para Map
      Map<String, dynamic> mapProdutos = jsonDecode(jsonString);

      totalProdutos = mapProdutos['DataSet']['Row'].length;

      print('total de Produtos no arquivo .xml--> $totalProdutos');

      //* Cria um List dos Maps
      List produtoListMap = [];

      for (var elemento = 0; elemento < totalProdutos; elemento++) {
        produtoListMap.add((mapProdutos['DataSet']['Row'][elemento]));
        elementProduto++;
        totalProdutos;
        update();
      }

      print('Produtoslistmap  sincronizacao_page--> $produtoListMap');
      final List<Produto> produtoListaObjeto = List<Produto>.from(
        produtoListMap.map((model) => Produto.fromMap(model)),
      );

      return produtoListaObjeto;
    } catch (e) {
      messageToast("ERRO INESPERADO!(Produto)");

      erroGeral = true;
    }
    return [];
  }

  Future<int> salvarProduto(Produto produto) async {
    int resultado = await produtoDao.salvar(produto);
    return resultado;
  }

//TODO

  Future<int> apagaTodosOsProdutos() async {
    int resultado = await produtoDao.deleteAll();
    return resultado;
  }

//! FIM  PRODUTO

//* FIM DA SINCRONIZACAOCONTROLLER

  Future<bool?> messageToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<String> convertXmlToJson(String nomeDoArquivoXml) async {
    try {
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
      print(xmlString);

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
    } on Exception catch (e) {
      messageToast("Erro Inesperado!($nomeDoArquivoXml.xml)");
      print('CATCH =====================================================');
      print('erro--> $e ');

      erroGeral = true;
      print('FIM CATCH =====================================================');
    }
    return '';
  }
  // TODO CONVERTE XML PARA JSON COM TRYS CATCHES
  // Future<String> convertXmlToJson(String nomeDoArquivoXml) async {
  //   String filePath = '';

  //   File arquivo = File(filePath);
  //   String fileName = '$nomeDoArquivoXml.xml';
  //   DirectoryPath getPathFile = DirectoryPath();

  //   String storePath = '';

  //   try {
  //     storePath = await getPathFile.getPath();
  //     filePath = '$storePath/$fileName';
  //     arquivo = File(filePath);
  //     print('arquivo--> $arquivo');
  //   } on Exception catch (e) {
  //     messageToast("Arquivo não existe, faça o Download $e");
  //   }

  //   Xml2Json xml2json = Xml2Json();
  //   try {
  //     //* Lendo arquivo e convertendo em bytes
  //     Uint8List xmlBytes = await arquivo.readAsBytes();
  //     //* convertendo bytes para String
  //     String xmlString = String.fromCharCodes(xmlBytes);

  //     print("<<<<<<<<<<<<<<<<<<<<<<<<<INICIO xmlString");

  //     print(xmlString);
  //     print("<<<<<<<<<<<<<<<<<<<<<<<<<FIM xmlString");

  //     //* Criação de uma instância do converter XML para JSON
  //     print('xml2json--1> ${xml2json.toString()} ');

  //     xml2json.parse(xmlString);
  //     print('-------------');
  //     print('xml2json--2> ${xml2json.toString()} ');
  //   } on Exception catch (e) {
  //     messageToast("Erro $e");
  //   }

  //   String jsonString = '';
  //   try {
  //     //* Converte para JSON
  //     jsonString = xml2json.toParkerWithAttrs();
  //     print('jsonString --> $jsonString');

  //     return jsonString;
  //   } on Exception catch (e) {
  //     messageToast("Erro Inesperado!($nomeDoArquivoXml.xml)");
  //     print('CATCH =====================================================');
  //     print('erro--> $e');

  //     print('FIM CATCH =====================================================');
  //     erroGeral = true;
  //   }
  //   return '';
  // }

// //! com uso de ISOLATES
//   Future<String> convertXmlToJson(String nomeDoArquivoXml) async {
//     try {
//       String filePath = '';
//       var arquivo = File(filePath);
//       String fileName = '$nomeDoArquivoXml.xml';
//       var getPathFile = DirectoryPath();
//       print('getPathFile--> $getPathFile ');
//       var storePath = await getPathFile.getPath();
//       print('storePath--> $storePath');
//       filePath = '$storePath/$fileName';
//       print('filePath--> $filePath');

//       arquivo = File(filePath);
//       print('arquivo--> $arquivo');

//       //* Lendo arquivo e convertendo em bytes
//       Uint8List xmlBytes = await arquivo.readAsBytes();
//       // print('xmlBytes--> $xmlBytes');
//       // print('------------------------------------------------');
//       //* convertendo bytes para String
//       String xmlString = String.fromCharCodes(xmlBytes);
//       print(xmlString);

//       //* Criação de uma instância do converter XML para JSON
//       Xml2Json xml2json = Xml2Json();
//       // print(
//       //     '--------------------------------------------------------');
//       print('xml2json--1> ${xml2json.toString()} ');
//       // xml2json.parse(xmlString);
//       String jsonString = await xml2JsonParse(xmlString);
//       print('-------------');
//       print('xml2json--2> ${xml2json.toString()} ');

//       //* Converte para JSON
//       // final jsonString = xml2json.toParkerWithAttrs();
//       print('jsonString --> $jsonString');

//       return jsonString;
//     } on Exception catch (e) {
//       messageToast("Erro Inesperado!($nomeDoArquivoXml.xml)");
//       print('CATCH =====================================================');
//       print('erro--> $e');

//       print('FIM CATCH =====================================================');
//       erroGeral = true;
//     }
//     return '';
//   }

//   Future xml2JsonParse(String xml) async {
//     if (xml.isEmpty) {
//       return ''; // Retorna um mapa vazio para XML vazio
//     }

//     try {
//       return await Isolate.run(() {
//         Xml2Json xml2json = Xml2Json();
//         xml2json.parse(xml);
//         return xml2json.toParkerWithAttrs();
//       });
//     } catch (e) {
//       print('Erro na conversão XML: $e');
//       return ''; // Retorna um mapa vazio em caso de erro
//     }
//   }

// ! FIM DO USO COM ISOLATES
} //*  FIM DO CODIGO

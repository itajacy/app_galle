//* alterado em 26/09/24

//!  CONSEGUI LER O ARQUIVO, CRIAR O MAP E VARRER O MAP CRIANDO UM LIST
//!  AGORA PRECISO LER ESSA LISTA E GRAVAR CLIENTE POR CLIENTE NA TABELA DE CLIENTES
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/models/cliente.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_controller.dart';
import 'package:galle/app/widgets/general_icon_button.dart';
import 'package:xml2json/xml2json.dart';

import '../../core/colors_app.dart';
import '../../core/strings.dart';
import '../configuracao/widgets/directory_path.dart';

class SincronizacaoPage extends StatelessWidget {
  SincronizacaoPage({super.key});

  SincronizacaoController sincronizacaoClientesController =
      SincronizacaoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.screenBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsApp.appBarBackground,
        foregroundColor: ColorsApp.appBarForeground,
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.cached),
            Text(Strings.sincronizacao),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () {},
                ativo: false,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_30,
                buttonHeight: Sizes.sizeH_60,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar TODOS',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("15/03/2024 17:15"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () async {
                  //!  Conectando e baixando o arquivo Cliente.xml
                  await sincronizacaoClientesController.conexaoFTP();

                  //! =========== INICIO TESTE DO XML2JSON

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

                  //! =========== FIM TESTE DO XML2JSON

                  //* Converte para Map
                  Map<String, dynamic> mapCLientes = jsonDecode(jsonString);

                  int totalClientes = mapCLientes['DataSet']['Row'].length;

                  print('total de clientes no arquivo .xml--> $totalClientes');

                  //* Cria um List dos Maps
                  List clientesListMap = [];

                  for (var element = 0; element < totalClientes; element++) {
                    clientesListMap
                        .add((mapCLientes['DataSet']['Row'][element]));
                  }

                  print('Clienteslistmap--> $clientesListMap');
//! o problema está aqui abaixo, não está convertendo a lista de clientesListMap para lista de objetos Cliente,  pelo jeito
//! o Cliente.fromMap, não está funcionando por algum motivo
                  final List<Cliente> clienteListaObjeto = List<Cliente>.from(
                    clientesListMap
                        .map((model) => Cliente.fromMap(model, false)),
                  );
                  // print('======clienteListaObjeto======inicio====');
                  // print(clienteListaObjeto.length);
                  // print(clienteListaObjeto.toString());

                  // print('======clienteListaObjeto======fim====');
//! apagando TODOS OS CLIENTES DA TABELA
                  // sincronizacaoClientesController.apagaTodosOsClientes();
                  // print('TODOS OS CLIENTES FORAM APAGADOS!');

//!
                  int inclusos = 0;
                  int alterados = 0;

                  for (var elemento in clienteListaObjeto) {
                    // print('elemento==> ${elemento.nomeFantasia}');
                    int resposta = await sincronizacaoClientesController
                        .salvarOuAlterarClientes(elemento);
                    // print('RESPOSTA_PAGE--> $resposta');
                    if (resposta == 0) {
                      alterados++;
                    } else {
                      inclusos++;
                    }
                    // //! int resposta = await clientesDao.salvar(novoCliente);
                    // print('resposta --> $resposta');
                    print('============');
                  }

                  print(
                      'Total de Clientes Lidos do arquivo .xml--> ${clienteListaObjeto.length}');
                  print('Total de Clientes Alterados--> $alterados');
                  print('Total de Clientes Inclusos--> $inclusos');
//!
                  print('--------------------fim----------------------------');
                },
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_30,
                buttonHeight: Sizes.sizeH_60,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar Clientes',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("15/03/2024 17:15"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () {
                  //! apagando TODOS OS CLIENTES DA TABELA
                  sincronizacaoClientesController.apagaTodosOsClientes();
                  print('TODOS OS CLIENTES FORAM APAGADOS!');

//!
                },
                ativo: true,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_30,
                buttonHeight: Sizes.sizeH_60,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'APAGA TODOS OS CLIENTES',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("10/03/2024 08:07"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () {},
                ativo: false,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_30,
                buttonHeight: Sizes.sizeH_60,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar Produtos',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("10/03/2024 08:07"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () {},
                ativo: false,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_30,
                buttonHeight: Sizes.sizeH_60,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar Fotos',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("13/03/2024 10:25"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () {},
                ativo: false,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_30,
                buttonHeight: Sizes.sizeH_60,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Enviar Pedidos',
              ),
              const Column(
                children: [
                  Text("Último Envio"),
                  Text("15/09/2023 17:15"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () {},
                ativo: false,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_30,
                buttonHeight: Sizes.sizeH_60,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Envio por e-mail',
              ),
              const Column(
                children: [
                  Text("Último Envio"),
                  Text("01/01/2000 00:00"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // void f(Map<dynamic, dynamic> m) {
  //   for (dynamic s in m.values) {
  //     print(s);
  //   }
  // }
}

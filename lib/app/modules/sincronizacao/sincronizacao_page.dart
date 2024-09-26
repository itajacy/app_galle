//* alterado em 24/09/24
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/widgets/general_icon_button.dart';
import 'package:xml2json/xml2json.dart';

import '../../core/colors_app.dart';
import '../../core/strings.dart';
import '../configuracao/widgets/directory_path.dart';

class SincronizacaoPage extends StatelessWidget {
  const SincronizacaoPage({super.key});

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
                  //! =========== INICIO TESTE DO XML2JSON

                  String fileName = 'Cliente.xml';
                  var getPathFile = DirectoryPath();
                  var storePath = await getPathFile.getPath();
                  String filePath = '$storePath/$fileName';

                  var arquivo = File(filePath);

                  // Lendo arquivo e convertendo em bytes
                  Uint8List xmlBytes = await arquivo.readAsBytes();
                  // convertendo bytes para String
                  String xmlString = String.fromCharCodes(xmlBytes);

                  print('xmlBytes--> $xmlBytes');
                  print('-------------');
                  print('xmlString--> $xmlString');

                  // Criação de uma instância do converter XML para JSON
                  Xml2Json xml2json = Xml2Json();
                  print('-------------');
                  print('xml2json--1> ${xml2json.toString()} ');
                  xml2json.parse(xmlString);
                  print('-------------');
                  print('xml2json--2> ${xml2json.toString()} ');

                  // Converte para JSON
                  final jsonString = xml2json.toParkerWithAttrs();
                  // print('jsonString --> $jsonString');
                  // final jsonObject = json.decode(jsonString);

                  //! =========== FIM TESTE DO XML2JSON

                  Map mapCLientes = jsonDecode(jsonString);
//! veja linha abaixo
                  List clientesLIst = mapClientes['DataSet']['Row'];

                  // for (var element in mapCLientes) {

                  // }
                  // var total = mapCLientes.length;

                  f(mapCLientes);

                  // for (dynamic element in mapCLiente) {
                  //   print(element);
                  //   print(
                  //       '----------------------------------------------------- CLIENTE-> ');
                  // }

                  // print('Total de clientes --> $total');

                  // for (var i = 0; i < 10; i++) {
                  //   print(mapCLientes['DataSet']['Row'][i]);
                  //   print(
                  //       '----------------------------------------------------- CLIENTE-> $i');
                  // }
                  print(
                      '--------------------fim---------------------------------');

                  // List clientesLIst = mapClientes['DataSet']['Row'];
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

  void f(Map<dynamic, dynamic> m) {
    for (dynamic s in m.values) {
      print(s);
    }
  }
}

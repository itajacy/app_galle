//* alterado em 26/09/24

//!  CONSEGUI LER O ARQUIVO, CRIAR O MAP E VARRER O MAP CRIANDO UM LIST
//!  AGORA PRECISO LER ESSA LISTA E GRAVAR CLIENTE POR CLIENTE NA TABELA DE CLIENTES
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
                  print('getPathFile--> $getPathFile ');
                  var storePath = await getPathFile.getPath();
                  print('storePath--> $storePath');
                  String filePath = '$storePath/$fileName';
                  print('filePath--> $filePath');

                  var arquivo = File(filePath);
                  print('arquivo--> $arquivo');

                  //* Lendo arquivo e convertendo em bytes
                  Uint8List xmlBytes = await arquivo.readAsBytes();
                  print('xmlBytes--> $xmlBytes');
                  print(
                      '---------------------------------------------------------------------');
                  //* convertendo bytes para String
                  String xmlString = String.fromCharCodes(xmlBytes);

//! PARA VOLTAR A LER O ARQUIVO BASTA APAGAR A VARIAVEL xmlString abaixo ;
//                   xmlString = '''
// <DataSet>
//   <Row>
//     <ClienteID_Int>0001-00</ClienteID_Int>
//     <DispositivoID>0</DispositivoID>
//     <ClienteID_Mob>8819</ClienteID_Mob>
//     <TipoPessoa>J</TipoPessoa>
//     <CGCCPF>07.237.672/0001-64</CGCCPF>
//     <IERG>282121420113</IERG>
//     <RazaoSocial>CURURU MARIA BABBONI - ME.</RazaoSocial>
//     <NomeFantasia>CURURU MARIA BABBONI - ME.</NomeFantasia>
//     <Contato>CURURU</Contato>
//     <FoneCom1>012-3144 4266</FoneCom1>
//     <FoneCom2/>
//     <FoneCel/>
//     <FoneRes/>
//     <FoneFax/>
//     <Email>babboni@itelefonica.com.br</Email>
//     <S_Endereco>R.CAPITAO NECO, 178</S_Endereco>
//     <S_Complemento/>
//     <S_Bairro>CENTRO</S_Bairro>
//     <S_Cidade>CRUZEIRO</S_Cidade>
//     <S_UF>SP</S_UF>
//     <S_CEP>12.701-350</S_CEP>
//     <E_Endereco>R.CAPITAO NECO, 178</E_Endereco>
//     <E_Complemento/>
//     <E_Bairro>CENTRO</E_Bairro>
//     <E_Cidade>CRUZEIRO</E_Cidade>
//     <E_UF>SP</E_UF>
//     <E_CEP>12.701-350</E_CEP>
//   </Row>
//   <Row>
//     <ClienteID_Int>0002-00</ClienteID_Int>
//     <DispositivoID>0</DispositivoID>
//     <ClienteID_Mob>6692</ClienteID_Mob>
//     <TipoPessoa>J</TipoPessoa>
//     <CGCCPF>71.951.149/0001-02</CGCCPF>
//     <IERG>392.073.527.110</IERG>
//     <RazaoSocial>ELIANA ANGELA RAMOS BIONDI ME</RazaoSocial>
//     <NomeFantasia>ELIANA ANGELA RAMOS BIONDI ME</NomeFantasia>
//     <Contato>PEDRO</Contato>
//     <FoneCom1>012-3951 9792</FoneCom1>
//     <FoneCom2/>
//     <FoneCel/>
//     <FoneRes/>
//     <FoneFax/>
//     <Email/>
//     <S_Endereco>R.CHAQUIB SLEIMAN AHMED, 13</S_Endereco>
//     <S_Complemento/>
//     <S_Bairro>JD.PEREIRA DO AMPARO</S_Bairro>
//     <S_Cidade>JACAREI</S_Cidade>
//     <S_UF>SP</S_UF>
//     <S_CEP>12.327-700</S_CEP>
//     <E_Endereco>R.CHAQUIB SLEIMAN AHMED, 13</E_Endereco>
//     <E_Complemento/>
//     <E_Bairro>JD.PEREIRA DO AMPARO</E_Bairro>
//     <E_Cidade>JACAREI</E_Cidade>
//     <E_UF>SP</E_UF>
//     <E_CEP>12.327-700</E_CEP>
//   </Row>
//   <Row>
//     <ClienteID_Int>0003-00</ClienteID_Int>
//     <DispositivoID>0</DispositivoID>
//     <ClienteID_Mob>6693</ClienteID_Mob>
//     <TipoPessoa>J</TipoPessoa>
//     <CGCCPF>00.574.549/0001-90</CGCCPF>
//     <IERG>392.081.120.117</IERG>
//     <RazaoSocial>BIONDI MARTINS LTDA</RazaoSocial>
//     <NomeFantasia>BIONDI MARTINS LTDA</NomeFantasia>
//     <Contato/>
//     <FoneCom1/>
//     <FoneCom2/>
//     <FoneCel/>
//     <FoneRes/>
//     <FoneFax/>
//     <Email/>
//     <S_Endereco>PC.INDEPENDENCIA, 168</S_Endereco>
//     <S_Complemento/>
//     <S_Bairro>JD.INDEPENDENCIA</S_Bairro>
//     <S_Cidade>JACAREI</S_Cidade>
//     <S_UF>SP</S_UF>
//     <S_CEP>12.300-000</S_CEP>
//     <E_Endereco>PC.INDEPENDENCIA, 168</E_Endereco>
//     <E_Complemento/>
//     <E_Bairro>JD.INDEPENDENCIA</E_Bairro>
//     <E_Cidade>JACAREI</E_Cidade>
//     <E_UF>SP</E_UF>
//     <E_CEP>12.300-000</E_CEP>
//   </Row>
// </DataSet>
// ''';

                  // print('xmlString--> $xmlString');

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
                  Map mapCLientes = jsonDecode(jsonString);

                  int totalClientes = mapCLientes['DataSet']['Row'].length;

                  //* Cria um List dos Maps
                  List clientesList = [];

                  for (var element = 0; element < totalClientes; element++) {
                    clientesList.add((mapCLientes['DataSet']['Row'][element]));
                  }

                  for (var elemento in clientesList) {
                    print('============');
                    print(
                        '${elemento['ClienteID_Int'].toString()}  ${elemento['NomeFantasia'].toString()}');
                    print('============');
                  }

                  print('Total de Clientes--> ${clientesList.length}');

                  // clientesList.forEach(print);

                  print('--------------------fim----------------------------');

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

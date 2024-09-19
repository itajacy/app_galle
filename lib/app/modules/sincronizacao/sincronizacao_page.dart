import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/widgets/general_icon_button.dart';
import 'package:xml2json/xml2json.dart';

import '../../core/colors_app.dart';
import '../../core/strings.dart';
import '../../models/cliente.dart';

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
                onPress: () {
                  //! =========== INICIO TESTE DO XML2JSON

// Seu XML como uma string
                  String xml = '''
<DataSet>
  <Row>
    <ClienteID_Int>0094-00</ClienteID_Int>
    <DispositivoID>0</DispositivoID>
    <ClienteID_Mob>8819</ClienteID_Mob>
    <TipoPessoa>J</TipoPessoa>
    <CGCCPF>07.237.672/0001-64</CGCCPF>
    <IERG>282121420113</IERG>
    <RazaoSocial>CRISTIANE MARIA BABBONI - ME.</RazaoSocial>
    <NomeFantasia>CRISTIANE MARIA BABBONI - ME.</NomeFantasia>
    <Contato>CRISTIANE</Contato>
    <FoneCom1>012-3144 4266</FoneCom1>
    <FoneCom2/>
    <FoneCel/>
    <FoneRes/>
    <FoneFax/>
    <Email>babboni@itelefonica.com.br</Email>
    <S_Endereco>R.CAPITAO NECO, 178</S_Endereco>
    <S_Complemento/>
    <S_Bairro>CENTRO</S_Bairro>
    <S_Cidade>CRUZEIRO</S_Cidade>
    <S_UF>SP</S_UF>
    <S_CEP>12.701-350</S_CEP>
    <E_Endereco>R.CAPITAO NECO, 178</E_Endereco>
    <E_Complemento/>
    <E_Bairro>CENTRO</E_Bairro>
    <E_Cidade>CRUZEIRO</E_Cidade>
    <E_UF>SP</E_UF>
    <E_CEP>12.701-350</E_CEP>
  </Row>
</DataSet>
''';

                  // Criação de uma instância do converter XML para JSON
                  Xml2Json xml2json = Xml2Json();
                  print('-------------');
                  print('xml2json--1> ${xml2json.toString()} ');
                  xml2json.parse(xml);
                  print('-------------');

                  // Converte para JSON
                  final jsonString = xml2json.toParkerWithAttrs();
                  print('jsonString --> $jsonString');
                  // final jsonObject = json.decode(jsonString);

                  // String json = xml2json.toBadgerfish();   // BADGER

                  // Mostra o JSON resultante
                  // print(json); // BADGER

                  //! =========== FIM TESTE DO XML2JSON
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
}

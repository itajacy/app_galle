//* alterado em 26/09/24

import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_cliente_controller.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_controller.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_cor_controller.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_dispositivo_controller.dart';
import 'package:galle/app/modules/sincronizacao/widgets/sincronizacao_atualizacao_mensagem_cliente.dart';
import 'package:galle/app/modules/sincronizacao/widgets/sincronizacao_atualizacao_mensagem_cores.dart';
import 'package:galle/app/modules/sincronizacao/widgets/sincronizacao_atualizacao_mensagem_dispositivo.dart';
import 'package:galle/app/modules/sincronizacao/widgets/sincronizacao_atualizacao_mensagem_todos.dart';
import 'package:galle/app/services/connect_ftp.dart';
import 'package:galle/app/widgets/general_icon_button.dart';
import 'package:get/get.dart';

import '../../core/colors_app.dart';
import '../../core/strings.dart';

class SincronizacaoPage extends StatefulWidget {
  SincronizacaoPage({super.key});

  @override
  State<SincronizacaoPage> createState() => _SincronizacaoPageState();
}

class _SincronizacaoPageState extends State<SincronizacaoPage> {
  SincronizacaoClienteController sincronizacaoClienteController =
      Get.put(SincronizacaoClienteController());

  SincronizacaoDispositivoController sincronizacaoDispositivoController =
      SincronizacaoDispositivoController();

  SincronizacaoCorController sincronizacaoCorController =
      SincronizacaoCorController();

  SincronizacaoController sincronizacaoController = SincronizacaoController();

  @override
  void initState() {
    // TODO: implement initState

    // ConnectFtp().conexaoFTP();   //! descomentar depois de testar
    // ConnectFtp().conexaoFTP('Cliente');
    // ConnectFtp().conexaoFTP('Dispositivo');
    // ConnectFtp().conexaoFTP('Cor');
    // ConnectFtp().conexaoFTP('Grupo');
    // ConnectFtp().conexaoFTP('Imagem');
    // ConnectFtp().conexaoFTP('Linha');
    // ConnectFtp().conexaoFTP('Material');
    // ConnectFtp().conexaoFTP('Preco');
    // ConnectFtp().conexaoFTP('Produto');
    // ConnectFtp().conexaoFTP('Tabela');
    // ConnectFtp().conexaoFTP('Tamanho');
    // ConnectFtp().conexaoFTP('Tipo');
    super.initState();
  }

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
                onPress: () async {
                  // a eliminação dos dispositivos foi passada para dentro do controller, dentro .sincronizacaoDispositivo()
                  //! Dispositivo
                  await sincronizacaoDispositivoController
                      .apagaTodosOsDispositivos();
                  await sincronizacaoDispositivoController
                      .sincronizacaoDispositivo(context);
                  //! Cores
                  await sincronizacaoCorController.apagaTodasAsCores();
                  await sincronizacaoCorController.sincronizacaoCor(context);

                  //! ======================================== abaixo a chamada do TODOS ==>  Dispositivo e Cor
                  // SincronizacaoAtualizacaoMensagemTodos(
                  //   context: context,
                  //   sincronizacaoDispositivoController:
                  //       sincronizacaoDispositivoController,
                  //   sincronizacaoCorController: sincronizacaoCorController,
                  // ).showFullBottomSheet();
                },
                ativo: true,
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
                 
                  sincronizacaoController.sincronizacaoDispositivo(context);

                  // SincronizacaoAtualizacaoMensagemDispositivo(
                  //   context: context,
                  //   sincronizacaoDispositivoController:
                  //       sincronizacaoDispositivoController,
                  // ).showFullBottomSheet();
                  
                },
                ativo: true,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_30,
                buttonHeight: Sizes.sizeH_60,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar DISPOSITIVO',
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
                  sincronizacaoController.sincronizacaoCor(context);
                  // SincronizacaoAtualizacaoMensagemCores(
                  //   context: context,
                  //   sincronizacaoCorController:
                  // ).showFullBottomSheet();

                  //! ======================================== abaixo a chamada do TODOS ==>  Dispositivo e Cor
                },
                ativo: true,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_30,
                buttonHeight: Sizes.sizeH_60,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar CORES',
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
                  sincronizacaoController.sincronizacaoClientes(context);

                  // SincronizacaoAtualizacaoMensagemCliente(
                  //   context: context,
                  //   sincronizacaoClienteController:
                  //       sincronizacaoClienteController,
                  // ).showFullBottomSheet();
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

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     GeneralIconButton(
          //       onPress: () {
          //         //TODO POPUP DE MENSAGEM
          //       },
          //       ativo: true,
          //       icone: Icons.sync_outlined,
          //       iconSize: Sizes.sizeH_30,
          //       buttonHeight: Sizes.sizeH_60,
          //       buttonWidth: Sizes.sizeW_200,
          //       // titulo: 'Atualizar Produtos',
          //       titulo: 'MENSAGEM DE POP UP',
          //     ),
          //     const Column(
          //       children: [
          //         Text("Última Atualização"),
          //         Text("10/03/2024 08:07"),
          //       ],
          //     ),
          //   ],
          // ),
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
                onPress: () {
                  //! apagando TODOS OS CLIENTES DA TABELA
                  sincronizacaoClienteController.apagaTodosOsClientes();
                  print('TODOS OS CLIENTES FORAM APAGADOS!');
                  sincronizacaoDispositivoController.apagaTodosOsDispositivos();
                  print('OS DADOS DO DISPOSITIVO FORAM APAGADOS!');
                  sincronizacaoCorController.apagaTodasAsCores();
                  print('TODAS AS CORES FORAM APAGADAS!');
                },
                ativo: true,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_30,
                buttonHeight: Sizes.sizeH_60,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'APAGA TODAS as Tabelas.',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("10/03/2024 08:07"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

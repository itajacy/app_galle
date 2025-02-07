//* alterado em 26/09/24

import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_cliente_controller.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_cor_controller.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_dispositivo_controller.dart';
import 'package:galle/app/modules/sincronizacao/widgets/sincronizacao_atualizacao_mensagem_cliente.dart';
import 'package:galle/app/modules/sincronizacao/widgets/sincronizacao_atualizacao_mensagem_cores.dart';
import 'package:galle/app/modules/sincronizacao/widgets/sincronizacao_atualizacao_mensagem_dispositivo.dart';
import 'package:galle/app/modules/sincronizacao/widgets/sincronizacao_atualizacao_mensagem_todos.dart';
import 'package:galle/app/widgets/general_icon_button.dart';
import 'package:get/get.dart';

import '../../core/colors_app.dart';
import '../../core/strings.dart';

class SincronizacaoPage extends StatelessWidget {
  SincronizacaoPage({super.key});

  SincronizacaoClienteController sincronizacaoClienteController =
      Get.put(SincronizacaoClienteController());

  SincronizacaoDispositivoController sincronizacaoDispositivoController =
      SincronizacaoDispositivoController();

  SincronizacaoCorController sincronizacaoCorController =
      SincronizacaoCorController();

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
                  // await sincronizacaoDispositivoController
                  //     .apagaTodosOsDispositivos();
                  // await sincronizacaoDispositivoController
                  //     .sincronizacaoDispositivo(context);
                  //! Cores
                  // await sincronizacaoCorController.apagaTodasAsCores();
                  // await sincronizacaoCorController.sincronizacaoCor(context);

                  // SincronizacaoAtualizacaoMensagemDispositivo(
                  //   context: context,
                  //   sincronizacaoDispositivoController:
                  //       sincronizacaoDispositivoController,
                  // ).showFullBottomSheet();
                  SincronizacaoAtualizacaoMensagemCores(
                    context: context,
                    sincronizacaoCorController: sincronizacaoCorController,
                  ).showFullBottomSheet();

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
                  SincronizacaoAtualizacaoMensagemCliente(
                    context: context,
                    sincronizacaoClienteController:
                        sincronizacaoClienteController,
                  ).showFullBottomSheet();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () {
                  //TODO POPUP DE MENSAGEM
                },
                ativo: true,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_30,
                buttonHeight: Sizes.sizeH_60,
                buttonWidth: Sizes.sizeW_200,
                // titulo: 'Atualizar Produtos',
                titulo: 'MENSAGEM DE POP UP',
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

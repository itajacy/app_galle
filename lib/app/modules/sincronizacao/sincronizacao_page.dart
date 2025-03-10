//* alterado em 26/09/24

import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_controller.dart';
import 'package:galle/app/widgets/general_icon_button.dart';

import '../../core/colors_app.dart';
import '../../core/strings.dart';
import '../../services/connect_ftp.dart';

class SincronizacaoPage extends StatefulWidget {
  const SincronizacaoPage({super.key});

  @override
  State<SincronizacaoPage> createState() => _SincronizacaoPageState();
}

class _SincronizacaoPageState extends State<SincronizacaoPage> {
  SincronizacaoController sincronizacaoController = SincronizacaoController();

  @override
  void initState() {
    // TODO: implement initState

    // ConnectFtp()
    //     .conexaoFTP(); //! descomentar depois de testar PARA FAZER O DOWNLOAD DOS ARQUIVOS

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
                  ConnectFtp().conexaoFTP();

                  // SincronizacaoAtualizacaoMensagemDispositivo(
                  //   context: context,
                  //   sincronizacaoDispositivoController:
                  //       sincronizacaoDispositivoController,
                  // ).showFullBottomSheet();
                },
                ativo: true,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Download arquivos .XML',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("09/03/2025 11:50"),
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
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
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
                },
                ativo: true,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
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
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
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
                onPress: () async {
                  sincronizacaoController.sincronizacaoGrupo(context);

                  // SincronizacaoAtualizacaoMensagemCliente(
                  //   context: context,
                  //   sincronizacaoClienteController:
                  //       sincronizacaoClienteController,
                  // ).showFullBottomSheet();
                },
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar Grupos',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("25/02/2025 20:38"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () async {
                  sincronizacaoController.sincronizacaoLinha(context);

                  // SincronizacaoAtualizacaoMensagemCliente(
                  //   context: context,
                  //   sincronizacaoClienteController:
                  //       sincronizacaoClienteController,
                  // ).showFullBottomSheet();
                },
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar Linhas',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("26/02/2025 16:03"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () async {
                  sincronizacaoController.sincronizacaoTipo(context);
                },
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar Tipos',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("26/02/2025 16:03"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () async {
                  sincronizacaoController.sincronizacaoTamanho(context);
                },
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar Tamanhos',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("27/02/2025 09:15"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () async {
                  sincronizacaoController.sincronizacaoTabela(context);
                },
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar Tabelas',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("27/02/2025 10:38"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () async {
                  sincronizacaoController.sincronizacaoMaterial(context);
                },
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar Material',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("27/02/2025 14:25"),
                ],
              ),
            ],
          ),
          // Row(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () async {
                  sincronizacaoController.sincronizacaoImagem(context);
                },
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar Imagens',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("05/03/2025 21:15"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () async {
                  sincronizacaoController.sincronizacaoPreco(context);
                },
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar Precos',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("06/03/2025 11:16"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () async {
                  sincronizacaoController.sincronizacaoProduto(context);
                },
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
                buttonWidth: Sizes.sizeW_200,
                titulo: 'Atualizar Produtos',
              ),
              const Column(
                children: [
                  Text("Última Atualização"),
                  Text("08/03/2025 20:10"),
                ],
              ),
            ],
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     GeneralIconButton(
          //       onPress: () {},
          //       ativo: false,
          //       icone: Icons.sync_outlined,
          //       iconSize: Sizes.sizeH_25,
          //       buttonHeight: Sizes.sizeH_30,
          //       buttonWidth: Sizes.sizeW_200,
          //       titulo: 'Atualizar Fotos',
          //     ),
          //     const Column(
          //       children: [
          //         Text("Última Atualização"),
          //         Text("13/03/2024 10:25"),
          //       ],
          //     ),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GeneralIconButton(
                onPress: () {
                  //! apagando TODOS OS CLIENTES DA TABELA
                  sincronizacaoController
                      .apagaTodosOsClientes(); //! LEMBRAR QUE OS CLIENTES NÃO DEVEM SER APAGADOS, DEVEM SER SOMENTE ALTERADOS
                  // sincronizacaoClienteController.apagaTodosOsClientes();
                  print('TODOS OS CLIENTES FORAM APAGADOS!');
                  sincronizacaoController.apagaTodosOsDispositivos();
                  print('OS DADOS DO DISPOSITIVO FORAM APAGADOS!');
                  sincronizacaoController.apagaTodasAsCores();
                  print('TODAS AS CORES FORAM APAGADAS!');
                  sincronizacaoController.apagaTodosOsGrupos();
                  print('TODOS OS GRUPOS FORAM APAGADOS!');
                  sincronizacaoController.apagaTodasAsLinhas();
                  print('TODOS AS LINHAS FORAM APAGADAS!');
                  sincronizacaoController.apagaTodosOsTipos();
                  print('TODOS OS TIPOS FORAM APAGADOS!');
                  sincronizacaoController.apagaTodosOsTamanhos();
                  print('TODOS OS TAMANHOS FORAM APAGADOS!');
                  sincronizacaoController.apagaTodasAsTabelas();
                  print('TODOS AS TABELAS FORAM APAGADAS!');
                  sincronizacaoController.apagaTodosOsMateriais();
                  print('TODOS OS MATERIAIS FORAM APAGADAS!');
                  sincronizacaoController.apagaTodasAsImagens();
                  print('TODOS AS IMAGENS FORAM APAGADAS!');
                  sincronizacaoController.apagaTodosOsPrecos();
                  print('TODOS OS PRECOS FORAM APAGADOS!');
                  sincronizacaoController.apagaTodosOsProdutos();
                  print('TODOS OS PRODUTOS FORAM APAGADOS!');
                },
                ativo: true,
                icone: Icons.sync_outlined,
                iconSize: Sizes.sizeH_25,
                buttonHeight: Sizes.sizeH_30,
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

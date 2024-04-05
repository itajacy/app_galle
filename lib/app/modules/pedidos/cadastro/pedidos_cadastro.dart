import 'package:flutter/material.dart';
import 'package:galle/app/core/navigation/routes.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/core/space.dart';
import 'package:galle/app/modules/pedidos/widgets/pedidos_status_button.dart';
import 'package:galle/app/widgets/general_icon_button.dart';

import '../../../core/colors_app.dart';
import '../../../core/font.dart';
import '../../../core/strings.dart';

class PedidosCadastro extends StatelessWidget {
  PedidosCadastro({super.key});

  final pedidoQtdItensController = TextEditingController();
  final pedidoValorTotalController = TextEditingController();
  final pedidoClienteController = TextEditingController();
  final pedidoTabelasController = TextEditingController();
  final pedidoObsController = TextEditingController();

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
            Icon(Icons.add_shopping_cart_rounded),
            Text(Strings.pedidosCadastro),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Space.spacing_8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GeneralIconButton(
                  onPress: () {},
                  icone: Icons.local_post_office_outlined,
                  iconSize: Sizes.sizeH_35,
                  buttonWidth: Sizes.sizeW_110,
                  buttonHeight: Sizes.sizeH_40,
                ),
                GeneralIconButton(
                  onPress: () {},
                  icone: Icons.print_outlined,
                  iconSize: Sizes.sizeH_35,
                  buttonWidth: Sizes.sizeW_110,
                  buttonHeight: Sizes.sizeH_40,
                ),
                GeneralIconButton(
                  onPress: () {
                    Navigator.of(context)
                        .pushNamed(Routes.pedidosCadastroItens);
                  },
                  icone: Icons.article_outlined,
                  iconSize: Sizes.sizeH_35,
                  buttonWidth: Sizes.sizeW_110,
                  buttonHeight: Sizes.sizeH_40,
                  titulo: Strings.itensMaiusculo,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(Space.spacing_8),
              decoration:
                  BoxDecoration(border: Border.all(width: Sizes.sizeW_1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        Strings.status,
                        style: TextStyle(
                            fontSize: Font.title_16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      PedidosStatusButton(),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.itens,
                    style: TextStyle(
                      fontSize: Font.title_16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Sizes.sizeH_60,
                    width: MediaQuery.of(context).size.width > 450
                        ? Sizes.sizeW_200
                        : Sizes.sizeW_80,
                    // width: Sizes.sizeW_80,
                    child: TextField(
                      controller: pedidoQtdItensController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: Space.spacing_5),
                  const Text(
                    Strings.total,
                    style: TextStyle(
                      fontSize: Font.title_16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Sizes.sizeH_60,
                    // width: Sizes.sizeW_100,
                    width: MediaQuery.of(context).size.width > 450
                        ? Sizes.sizeW_200
                        : Sizes.sizeW_100,
                    child: TextField(
                      controller: pedidoValorTotalController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  GeneralIconButton(
                    onPress: () {},
                    icone: Icons.article_outlined,
                    iconSize: Sizes.sizeH_40,
                    buttonWidth: Sizes.sizeW_64,
                    buttonHeight: Sizes.sizeH_40,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: Sizes.sizeH_60,
                    width: MediaQuery.of(context).size.width - 100,
                    child: TextField(
                      controller: pedidoClienteController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.cliente,
                        labelStyle: TextStyle(fontSize: Font.title_24),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  GeneralIconButton(
                    onPress: () {},
                    icone: Icons.search,
                    iconSize: Sizes.sizeH_40,
                    buttonWidth: Sizes.sizeW_64,
                    buttonHeight: Sizes.sizeH_40,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: Sizes.sizeH_60,
                    width: MediaQuery.of(context).size.width - 100,
                    child: TextField(
                      controller: pedidoTabelasController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: Strings.tabelas,
                        labelStyle: TextStyle(fontSize: Font.title_24),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  GeneralIconButton(
                    onPress: () {},
                    icone: Icons.search,
                    iconSize: Sizes.sizeH_40,
                    buttonWidth: Sizes.sizeW_64,
                    buttonHeight: Sizes.sizeH_40,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_8),
              child: TextField(
                maxLines: 7,
                controller: pedidoObsController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: Strings.observacoes,
                  labelStyle: TextStyle(fontSize: Font.title_24),
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

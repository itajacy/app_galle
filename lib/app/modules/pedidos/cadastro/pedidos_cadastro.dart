import 'package:flutter/material.dart';
import 'package:galle/app/core/navigation/routes.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/core/space.dart';
import 'package:galle/app/modules/pedidos/widgets/pedidos_button.dart';
import 'package:galle/app/modules/pedidos/widgets/pedidos_status_button.dart';
import 'package:galle/app/widgets/simple_icon_button.dart';

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
                PedidosButton(
                  onPress: () {},
                  icone: Icons.local_post_office_outlined,
                ),
                PedidosButton(
                  onPress: () {},
                  icone: Icons.print_outlined,
                ),
                PedidosButton(
                  onPress: () {
                    Navigator.of(context)
                        .pushNamed(Routes.pedidosCadastroItens);
                  },
                  titulo: Strings.itensMaiusculo,
                  icone: Icons.article_outlined,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(Space.spacing_8),
              decoration: BoxDecoration(border: Border.all(width: 1)),
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
                    width: Sizes.sizeW_80,
                    child: TextField(
                      controller: pedidoQtdItensController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    Strings.total,
                    style: TextStyle(
                      fontSize: Font.title_16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Sizes.sizeH_60,
                    width: Sizes.sizeW_100,
                    child: TextField(
                      controller: pedidoValorTotalController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SimpleIconButton(
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
                    width: 300,
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
                  SimpleIconButton(
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
                    width: 300,
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
                  SimpleIconButton(
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

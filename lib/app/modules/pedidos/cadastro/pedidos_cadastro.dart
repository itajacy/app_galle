import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/core/space.dart';
import 'package:galle/app/modules/pedidos/widgets/pedidos_button.dart';
import 'package:galle/app/modules/pedidos/widgets/pedidos_status_button.dart';

import '../../../core/font.dart';
import '../../../core/strings.dart';

class PedidosCadastro extends StatelessWidget {
  PedidosCadastro({super.key});

  final pedidoQtdItensController = TextEditingController();
  final pedidoValorTotalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  onPress: () {},
                  titulo: "ITENS",
                  icone: Icons.article_outlined,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(Space.spacing_8),
              decoration: BoxDecoration(border: Border.all(width: 2)),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Itens:'),
                  SizedBox(
                    height: Sizes.sizeH_50,
                    width: Sizes.sizeW_80,
                    child: TextField(
                      controller: pedidoQtdItensController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // labelText: Strings.digiteEmail,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Text('Total:'),
                  SizedBox(
                    height: Sizes.sizeH_50,
                    width: Sizes.sizeW_130,
                    child: TextField(
                      controller: pedidoValorTotalController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // labelText: Strings.digiteEmail,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.article_outlined,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: Space.spacing_8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.cliente,
                  style: TextStyle(
                      fontSize: Font.title_16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/core/space.dart';
import 'package:galle/app/modules/pedidos/cadastro/itens/widgets/itens_um_dropdown.dart';
import 'package:galle/app/widgets/simple_icon_button.dart';

import '../../../../core/colors.dart';
import '../../../../core/font.dart';
import '../../../../core/strings.dart';

class PedidosCadastroItens extends StatelessWidget {
  const PedidosCadastroItens({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.appBarBackground,
        foregroundColor: ColorsApp.appBarForeground,
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.article_outlined),
            Text(Strings.itensDoPedido),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Space.spacing_8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  Strings.total,
                  style: TextStyle(
                      fontSize: Font.title_24, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: Space.spacing_15),
                SizedBox(
                  width: Sizes.sizeW_170,
                  child: TextField(),
                ),
                SizedBox(width: 15),
                SimpleIconButton(
                    onPress: () {},
                    icone: Icons.article_outlined,
                    size: Sizes.sizeH_40),
                SizedBox(
                  height: Space.spacing_5,
                ),
              ],
            ),
            SizedBox(
              height: Space.spacing_24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Sizes.sizeW_150,
                  child: TextField(
                    // controller: pedidoClienteController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: Strings.produto,
                      labelStyle: TextStyle(fontSize: Font.title_20),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: Space.spacing_5),
                //! Icone de pesquisa de produto
                // SimpleIconButton(
                //   onPress: () {},
                //   icone: Icons.search,
                //   size: Sizes.sizeH_40,
                // ),
                SizedBox(
                  width: Sizes.sizeW_80,
                  child: TextField(
                    // controller: pedidoClienteController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: Strings.qtde,
                      labelStyle: TextStyle(fontSize: Font.title_20),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: Space.spacing_5),
                ItensUmDropdown(),
              ],
            ),
            SizedBox(height: Space.spacing_24),
            TextField(
              // controller: pedidoClienteController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: Strings.observacaoProduto,
                labelStyle: TextStyle(fontSize: Font.title_20),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: Space.spacing_8),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            Strings.valorUn,
                            style: TextStyle(fontSize: Font.title_16),
                          ),
                          Text(
                            Strings.valorG,
                            style: TextStyle(fontSize: Font.title_16),
                          ),
                          Text(
                            Strings.valorTotal,
                            style: TextStyle(fontSize: Font.title_16),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('0,00'),
                          Text('0,00'),
                          Text('0,00'),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SimpleIconButton(
                        onPress: () {},
                        icone: Icons.check_box,
                        size: Sizes.sizeH_40,
                      ),
                    ],
                  ),
                ),

                //! como colocar o $ aqui ??????
              ],
            ),
            SizedBox(height: Space.spacing_8),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    
                    Text("01-002AG   Pingente Placa  "),
                    Text("10,00un      2,49      24,90  "),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

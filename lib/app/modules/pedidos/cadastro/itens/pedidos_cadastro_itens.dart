import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/core/space.dart';
import 'package:galle/app/modules/pedidos/cadastro/itens/widgets/itens_um_dropdown.dart';
import 'package:galle/app/widgets/simple_icon_button.dart';

import '../../../../core/colors_app.dart';
import '../../../../core/font.dart';
import '../../../../core/strings.dart';

class PedidosCadastroItens extends StatelessWidget {
  PedidosCadastroItens({super.key});

  List<String> lista = [
    '01-002',
    '01-0023',
    '01-0024',
    '01-0025',
    '01-0026',
    '01-0027',
    '01-0028',
    '01-0029',
    '01-0030',
  ];

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
                      Padding(
                        padding: const EdgeInsets.only(right: Space.spacing_2),
                        child: SimpleIconButton(
                          onPress: () {},
                          icone: Icons.check_box,
                          size: Sizes.sizeH_40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: Space.spacing_8),
            //!! abaixo o espaço para a lista de itens cadastrados
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: lista.length,
                // prototypeItem: ListTile(title: Text('$lista[0]')),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: ListTile(
                      // dense: true,
                      // visualDensity: VisualDensity.standard,
                      shape: Border.all(width: 1, style: BorderStyle.none),
                      contentPadding: EdgeInsets.all(1.0),
                      title: Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     width: 2,
                        //     color: Colors.black,
                        //   ),
                        // ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        lista[index],
                                        style:
                                            TextStyle(fontSize: Font.title_16),
                                      ),
                                      Text(
                                        "Descricao da peça",
                                        style:
                                            TextStyle(fontSize: Font.title_16),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('10,00'),
                                      Text('1,50'),
                                      Text('15,00'),
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: Space.spacing_2),
                                    child: SimpleIconButton(
                                      onPress: () {},
                                      icone: Icons.delete_forever_outlined,
                                      size: Sizes.sizeH_40,
                                      iconeForegroundColor:
                                          Color.fromARGB(255, 0, 255, 255),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

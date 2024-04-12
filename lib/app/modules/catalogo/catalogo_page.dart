import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/core/space.dart';
import 'package:galle/app/widgets/general_icon_button.dart';

import '../../core/colors_app.dart';
import '../../core/font.dart';
import '../../core/strings.dart';

class CatalogoPage extends StatelessWidget {
  CatalogoPage({super.key});

  final codigoDoProdutoController = TextEditingController();

  //! inicio dos  dados para teste do gridview
  final String codigoDoProduto = '01-002';
  final String precoUnitario = '3,56/un';
  final String precoPorGrama = '4,81/g';
  final String descricaoDoProduto =
      'Pingente Placa Vazada de Cruz / 10x24mm / 0,7g';

  //! fim dos  dados para teste do gridview

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
            Icon(Icons.photo_camera_outlined),
            Text(Strings.catalogo),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Space.spacing_8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Padding(
                padding: const EdgeInsets.only(left: Space.spacing_8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width > 450
                      ? Sizes.sizeW_400
                      : Sizes.sizeW_180,
                  child: TextField(
                    controller: codigoDoProdutoController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: Strings.produto,
                      labelStyle: TextStyle(fontSize: Font.title_20),
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
              ),
              GeneralIconButton(
                onPress: () {},
                icone: Icons.photo_camera_rounded,
                iconSize: Sizes.sizeH_30,
                buttonWidth: Sizes.sizeW_55,
                buttonHeight: Sizes.sizeH_55,
              ),
              GeneralIconButton(
                onPress: () {},
                icone: Icons.tune_rounded,
                iconSize: Sizes.sizeH_30,
                buttonWidth: Sizes.sizeW_55,
                buttonHeight: Sizes.sizeH_55,
              ),
              Padding(
                padding: const EdgeInsets.only(right: Space.spacing_8),
                child: GeneralIconButton(
                  onPress: () {},
                  icone: Icons.shopping_cart_outlined,
                  iconSize: Sizes.sizeH_30,
                  buttonWidth: Sizes.sizeW_55,
                  buttonHeight: Sizes.sizeH_55,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Space.spacing_8,
          ),
          Expanded(
            child: GridView.count(
              // padding: EdgeInsets.only(bottom: 100),
              childAspectRatio: (13 / 16),
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(100, (index) {
                return Padding(
                  padding: const EdgeInsets.all(Space.spacing_8),
                  child: Column(
                    children: [
                      Container(
                        color: ColorsApp.catalogotextbackgroundColor,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: Space.spacing_2),
                          child: Text(
                            codigoDoProduto,
                            style: TextStyle(
                              color: ColorsApp.textForeground,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                precoUnitario,
                                style: TextStyle(
                                  fontSize: Font.title_12,
                                ),
                              ),
                              Text(
                                precoPorGrama,
                                style: TextStyle(
                                  fontSize: Font.title_12,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GeneralIconButton(
                                onPress: () {},
                                icone: Icons.add,
                                iconSize: Sizes.sizeH_30,
                                iconeForegroundColor: Colors.tealAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'http://app.galle.com.br/images/grandes/01-002.jpg'),
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: ColorsApp.catalogotextbackgroundColor,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(Space.spacing_2),
                          child: Text(
                            descricaoDoProduto,
                            style: TextStyle(
                              fontSize: Font.title_8,
                              color: ColorsApp.textForeground,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

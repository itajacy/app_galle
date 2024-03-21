import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/core/space.dart';
import 'package:galle/app/widgets/simple_icon_button.dart';

import '../../core/colors_app.dart';
import '../../core/font.dart';
import '../../core/strings.dart';

class CatalogoPage extends StatelessWidget {
  CatalogoPage({super.key});

  final codigoDoProdutoController = TextEditingController();

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: Sizes.sizeW_180,
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
              SimpleIconButton(
                onPress: () {},
                icone: Icons.photo_camera_rounded,
                size: Sizes.sizeH_40,
              ),
              SimpleIconButton(
                onPress: () {},
                icone: Icons.tune_rounded,
                size: Sizes.sizeH_40,
              ),
              SimpleIconButton(
                onPress: () {},
                icone: Icons.add_shopping_cart_rounded,
                size: Sizes.sizeH_40,
              ),
            ],
          ),
          SizedBox(
            height: Space.spacing_8,
          ),
        ],
      ),
    );
  }
}

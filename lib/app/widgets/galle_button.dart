//* alterado em 24/09/24

import 'package:flutter/material.dart';

import '../core/borders.dart';
import '../core/colors_app.dart';
import '../core/font.dart';
import '../core/sizes.dart';
import '../core/space.dart';

class GalleButton extends StatelessWidget {
  final Function onPress;
  final String titulo;
  final IconData icone;

  GalleButton({
    required this.titulo,
    required this.onPress,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.yellow,
      // Colors.grey.shade700
      backgroundColor: ColorsApp.buttonMenuBackground,
      minimumSize: const Size(Sizes.sizeW_150, Sizes.sizeH_70),
      padding: const EdgeInsets.all(Space.spacing_2),
      shape: RoundedRectangleBorder(
        borderRadius: Borders.borderRadius_10,
      ),
    );

    return ElevatedButton(
      onPressed: () {
        onPress();
      },
      style: raisedButtonStyle,
      child: Column(
        children: [
          Icon(
            icone,
            color: ColorsApp.iconeForegroundMain,
          ),
          const SizedBox(height: Space.spacing_5),
          Text(
            titulo,
            style: const TextStyle(
              color: ColorsApp.textForeground,
              fontSize: Font.title_16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}



/*  icones dos botoes
Icons.people_alt,
Icons.feed_rounded,
Icons.monetization_on_rounded,
Icons.photo_camera_outlined,
Icons.cached,
Icons.tune_rounded,

*/
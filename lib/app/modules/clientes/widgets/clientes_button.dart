import 'package:flutter/material.dart';

import '../../../core/borders.dart';
import '../../../core/colors_app.dart';
import '../../../core/font.dart';
import '../../../core/sizes.dart';
import '../../../core/space.dart';

class ClientesButton extends StatelessWidget {
  late Function onPress;
  late String titulo;
  late IconData icone;

  ClientesButton({
    required this.onPress,
    required this.titulo,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: ColorsApp.buttonMenuBackground,
      minimumSize: Size(Sizes.sizeW_150, Sizes.sizeH_40),
      padding: EdgeInsets.all(Space.spacing_2),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(Space.spacing_2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icone,
                  color: ColorsApp.iconeForegroundLSecond,
                ),
                SizedBox(
                  width: Space.spacing_5,
                ),
                Text(
                  titulo,
                  style: TextStyle(
                    color: ColorsApp.textForeground,
                    fontSize: Font.title_16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
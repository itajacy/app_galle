import 'package:flutter/material.dart';

import '../core/borders.dart';
import '../core/colors_app.dart';
import '../core/font.dart';
import '../core/sizes.dart';
import '../core/space.dart';

class GeneralIconButton extends StatelessWidget {
  late Function onPress;
  late IconData? icone;
  late double? iconSize;
  late Color? iconeForegroundColor;
  late double? buttonWidth;
  late double? buttonHeight;
  late String? titulo;

  GeneralIconButton({
    required this.onPress,
    this.icone,
    this.iconSize,
    this.iconeForegroundColor,
    this.buttonWidth,
    this.buttonHeight,
    this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.yellow,
      backgroundColor: ColorsApp.buttonMenuBackground,
      minimumSize:
          Size(buttonWidth ?? Sizes.sizeW_40, buttonHeight ?? Sizes.sizeH_40),
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(Space.spacing_2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icone,
                  color:
                      iconeForegroundColor ?? ColorsApp.iconeForegroundLSecond,
                  size: iconSize,
                ),
                Text(
                  // titulo!.isNotEmpty ? " $titulo" : "",
                  titulo ?? "",
                  style: TextStyle(
                    color: Colors.white,
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
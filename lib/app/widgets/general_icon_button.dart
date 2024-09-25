// alterado em 24/09/24
import 'package:flutter/material.dart';

import '../core/borders.dart';
import '../core/colors_app.dart';
import '../core/font.dart';
import '../core/sizes.dart';
import '../core/space.dart';

class GeneralIconButton extends StatelessWidget {
  final Function onPress;
  final IconData? icone;
  final double? iconSize;
  final Color? iconeForegroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final String? titulo;
  final bool ativo;

  GeneralIconButton({
    required this.onPress,
    this.icone,
    this.iconSize,
    this.iconeForegroundColor,
    this.buttonWidth,
    this.buttonHeight,
    this.titulo,
    this.ativo = true,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor:
          ativo ? Colors.yellow : const Color.fromARGB(255, 112, 116, 124),
      backgroundColor:
          ativo ? ColorsApp.buttonMenuBackground : ColorsApp.botaoDesativado,
      minimumSize:
          Size(buttonWidth ?? Sizes.sizeW_40, buttonHeight ?? Sizes.sizeH_40),
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(Space.spacing_2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icone,
                  color: ativo
                      ? ColorsApp.iconeForegroundLSecond
                      : ColorsApp.iconeDesativado,
                  size: iconSize,
                ),
                Text(
                  titulo ?? "",
                  style: const TextStyle(
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


import 'package:flutter/material.dart';

import '../../../core/borders.dart';
import '../../../core/colors_app.dart';
import '../../../core/font.dart';
import '../../../core/sizes.dart';
import '../../../core/space.dart';

class ClientesButton extends StatelessWidget {
  final Function onPress;
  final String titulo;
  final IconData icone;
  final bool ativo;
  final Size? minimoSize;

  ClientesButton({
    required this.onPress,
    required this.titulo,
    required this.icone,
    this.ativo = true,
    this.minimoSize,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor:
          ativo ? Colors.yellow : Colors.white54,
      backgroundColor:
          ativo ? ColorsApp.buttonMenuBackground : ColorsApp.botaoDesativado,
      minimumSize: (minimoSize == null)
          ? const Size(Sizes.sizeW_150, Sizes.sizeH_40)
          : minimoSize,
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
                  color: ativo
                      ? ColorsApp.iconeForegroundLSecond
                      : ColorsApp.iconeDesativado,
                ),
                const SizedBox(
                  width: Space.spacing_5,
                ),
                Text(
                  titulo,
                  style: TextStyle(
                    // color: ColorsApp.textForeground,
                    color: ativo
                        ? ColorsApp.textForeground
                        : ColorsApp.textoDesativado,
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
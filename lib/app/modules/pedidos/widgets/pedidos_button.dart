import 'package:flutter/material.dart';

import '../../../core/borders.dart';
import '../../../core/cores.dart';
import '../../../core/font.dart';
import '../../../core/sizes.dart';
import '../../../core/space.dart';

class PedidosButton extends StatelessWidget {
  late Function onPress;
  late String? titulo;
  late IconData? icone;

  PedidosButton({
    required this.onPress,
    this.titulo,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Cores.buttonMenuBackground,
      minimumSize: Size(Sizes.sizeW_100, Sizes.sizeH_40),
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
                  color: Colors.lightBlue,
                ),
                SizedBox(
                  width: Space.spacing_5,
                ),
                Text(
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
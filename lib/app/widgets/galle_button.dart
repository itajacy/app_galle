import 'package:flutter/material.dart';

import '../core/borders.dart';
import '../core/font.dart';
import '../core/sizes.dart';
import '../core/space.dart';

class GalleButton extends StatelessWidget {
  late Function onPress;
  late String titulo;
  late IconData icone;

  GalleButton({
    required this.titulo,
    required this.onPress,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.grey.shade700,
      minimumSize: Size(Sizes.sizeW_150, Sizes.sizeH_70),
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
        children: [
          Icon(
            icone,
            color: Colors.yellow,
          ),
          SizedBox(height: Space.spacing_5),
          Text(
            titulo,
            style: TextStyle(
              color: Colors.white,
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
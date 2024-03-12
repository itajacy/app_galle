import 'package:flutter/material.dart';

import '../core/borders.dart';
import '../core/cores.dart';
import '../core/space.dart';

class SimpleIconButton extends StatelessWidget {
  late Function onPress;
  late IconData? icone;
  late double size;

  SimpleIconButton(
      {required this.onPress, required this.icone, required this.size});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Cores.buttonMenuBackground,
      // minimumSize: Size(Sizes.sizeW_100, Sizes.sizeH_40),
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
          Padding(
            padding: const EdgeInsets.all(Space.spacing_2),
            child: Icon(
              icone,
              color: Colors.lightBlue,
              size: size,
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
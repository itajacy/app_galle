import 'package:flutter/material.dart';

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
      foregroundColor: Colors.black,
      backgroundColor: Colors.grey.shade700,
      minimumSize: Size(150, 40),
      padding: EdgeInsets.all(2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icone,
                  color: Colors.lightBlue,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  titulo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  late Function onPress;
  late String titulo;
  late IconData icone;

  HomePageButton({
    required this.onPress,
    required this.titulo,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.grey.shade600,
      minimumSize: Size(150, 70),
      padding: EdgeInsets.all(2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
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
          SizedBox(height: 5),
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
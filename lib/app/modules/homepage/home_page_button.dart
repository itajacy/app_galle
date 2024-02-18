import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  late Function onPress;
  late String titulo;

  HomePageButton({
    required this.onPress,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress(),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey.shade600,
        minimumSize: Size(180, 100),
        //padding: EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
      ),
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


/*
// colheita_botao.dart

class ColheitaBotao extends StatelessWidget {
  late var onPress;
  late var rotulo;
  late var color;
  ColheitaBotao({required this.onPress, this.rotulo, this.color});

  @override
  Widget build(BuildContext context) {
    final telaAltura = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        rotulo,
        style: TextStyle(
          fontSize: (telaAltura * 0.08) / 3, // equivalente a fonte tamanho 20
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF418E31),
        padding: EdgeInsets.all(telaAltura / 15),
      ),
    );
  }
}


    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.grey.shade600,
      minimumSize: Size(180, 100),
      //padding: EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
*/
import 'package:flutter/material.dart';

import '../../../core/colors_app.dart';
import '../../../core/strings.dart';

class PedidosConsulta extends StatelessWidget {
  const PedidosConsulta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.screenBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsApp.appBarBackground,
        foregroundColor: ColorsApp.appBarForeground,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.search),
            Text(Strings.pedidosConsulta),
          ],
        ),
      ),
      body: Container(),
    );
  }
}

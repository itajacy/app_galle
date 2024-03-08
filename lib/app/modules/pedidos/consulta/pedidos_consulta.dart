import 'package:flutter/material.dart';

import '../../../core/cores.dart';
import '../../../core/strings.dart';

class PedidosConsulta extends StatelessWidget {
  const PedidosConsulta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.appBarBackground,
        foregroundColor: Cores.appBarForeground,
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

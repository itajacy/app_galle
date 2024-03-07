import 'package:flutter/material.dart';

import '../../../core/strings.dart';

class PedidosCadastro extends StatelessWidget {
  const PedidosCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.pedidosCadastro),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.access_alarm),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.safety_check),
            ),
          ],
        ),
      ),
    );
  }
}

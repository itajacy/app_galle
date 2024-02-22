import 'package:flutter/material.dart';

import '../../core/navigation/strings.dart';

class PedidosPage extends StatelessWidget {
  const PedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Strings.pedidos),
      ),
      body: Container(),
    );
  }
}

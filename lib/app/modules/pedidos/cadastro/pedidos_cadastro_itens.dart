import 'package:flutter/material.dart';

import '../../../core/cores.dart';
import '../../../core/strings.dart';

class PedidosCadastroItens extends StatelessWidget {
  const PedidosCadastroItens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.appBarBackground,
        foregroundColor: Cores.appBarForeground,
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.article_outlined),
            Text(Strings.itensDoPedido),
          ],
        ),
      ),
      body: Container(),
    );
  }
}

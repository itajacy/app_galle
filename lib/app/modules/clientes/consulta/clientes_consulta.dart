import 'package:flutter/material.dart';

import '../../../core/cores.dart';
import '../../../core/strings.dart';

class ClientesConsulta extends StatelessWidget {
  const ClientesConsulta({super.key});

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
            Text(Strings.clientesConsulta),
          ],
        ),
      ),
      body: Container(),
    );
  }
}

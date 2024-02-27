import 'package:flutter/material.dart';

import '../../core/strings.dart';

class ClientesConsultar extends StatelessWidget {
  const ClientesConsultar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.search),
            Text(Strings.clientesConsultar),
          ],
        ),
      ),
      body: Container(),
    );
  }
}




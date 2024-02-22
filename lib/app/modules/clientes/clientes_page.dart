import 'package:flutter/material.dart';

import '../../core/navigation/strings.dart';

class ClientesPage extends StatelessWidget {
  const ClientesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Strings.clientes),
      ),
      body: Container(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/strings.dart';

class ConfiguracaoPage extends StatelessWidget {
  const ConfiguracaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Strings.configuracao),
      ),
      body: Container(),
    );
  }
}

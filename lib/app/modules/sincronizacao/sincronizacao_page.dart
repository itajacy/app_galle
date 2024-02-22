import 'package:flutter/material.dart';

import '../../core/navigation/strings.dart';

class SincronizacaoPage extends StatelessWidget {
  const SincronizacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Strings.sincronizacao),
      ),
      body: Container(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/strings.dart';

class PrecosPage extends StatelessWidget {
  const PrecosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Strings.precos),
      ),
      body: Container(),
    );
  }
}

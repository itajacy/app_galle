import 'package:flutter/material.dart';

import '../../core/strings.dart';

class CatalogoPage extends StatelessWidget {
  const CatalogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Strings.catalogo),
      ),
      body: Container(),
    );
  }
}

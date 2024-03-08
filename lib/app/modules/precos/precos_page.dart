import 'package:flutter/material.dart';

import '../../core/cores.dart';
import '../../core/strings.dart';

class PrecosPage extends StatelessWidget {
  const PrecosPage({super.key});

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
            Icon(Icons.monetization_on_rounded),
            Text(Strings.precos),
          ],
        ),
      ),
      body: Container(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/strings.dart';

class ConfiguracaoPage extends StatelessWidget {
  const ConfiguracaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.appBarBackground,
        foregroundColor: ColorsApp.appBarForeground,
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.tune_rounded),
            Text(Strings.configuracao),
          ],
        ),
      ),
      body: Container(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/colors_app.dart';
import '../../core/strings.dart';

class ConfiguracaoAmazon extends StatelessWidget {
  const ConfiguracaoAmazon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.screenBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsApp.appBarBackground,
        foregroundColor: ColorsApp.appBarForeground,
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.cloud_queue),
            Text(Strings.configuracaoAmazon),
          ],
        ),
      ),
      body: Container(),
    );
  }
}

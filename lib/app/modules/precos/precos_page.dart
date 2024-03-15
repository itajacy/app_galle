import 'package:flutter/material.dart';

import '../../core/colors_app.dart';
import '../../core/strings.dart';

class PrecosPage extends StatelessWidget {
  const PrecosPage({super.key});

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
            Icon(Icons.monetization_on_rounded),
            Text(Strings.precos),
          ],
        ),
      ),
      body: Container(),
    );
  }
}

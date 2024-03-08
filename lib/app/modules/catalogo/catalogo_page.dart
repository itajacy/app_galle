import 'package:flutter/material.dart';

import '../../core/cores.dart';
import '../../core/strings.dart';

class CatalogoPage extends StatelessWidget {
  const CatalogoPage({super.key});

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
            Icon(Icons.photo_camera_outlined),
            Text(Strings.catalogo),
          ],
        ),
      ),
      body: Container(),
    );
  }
}

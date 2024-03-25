import 'package:flutter/material.dart';

import '../../core/colors_app.dart';
import '../../core/navigation/routes.dart';
import '../../core/space.dart';
import '../../core/strings.dart';
import '../../widgets/galle_button.dart';

class ConfiguracaoPage extends StatelessWidget {
  const ConfiguracaoPage({super.key});

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
            Icon(Icons.tune_rounded),
            Text(Strings.configuracao),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: Space.spacing_30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GalleButton(
                onPress: () {
                  Navigator.of(context).pushNamed(Routes.configuracaoAmazon);
                },
                titulo: Strings.amazon,
                icone: Icons.cloud_queue,
              ),
              GalleButton(
                onPress: () {
                  Navigator.of(context).pushNamed(Routes.configuracaoFtp);
                },
                titulo: Strings.ftp,
                icone: Icons.filter_drama,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

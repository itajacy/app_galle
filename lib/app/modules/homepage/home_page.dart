import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import '../../core/colors_app.dart';
import '../../core/font.dart';
import '../../core/navigation/routes.dart';
import '../../core/strings.dart';
import '../../widgets/galle_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.appBarBackground,
        foregroundColor: ColorsApp.appBarForeground,
        title: Column(
          children: [
            Container(
              height: Sizes.sizeH_25,
              child: Image.asset(
                'assets/galle_branco_800.png',
                height: Sizes.sizeH_50,
                fit: BoxFit.fill,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  Strings.versao,
                  style: TextStyle(
                      fontSize: Font.subtitle_10, color: Colors.yellow),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        color: ColorsApp.screenBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GalleButton(
                  onPress: () {
                    Navigator.of(context).pushNamed(Routes.clientesPage);
                  },
                  titulo: Strings.clientes,
                  icone: Icons.people_alt,
                ),
                GalleButton(
                  onPress: () {
                    Navigator.of(context).pushNamed(Routes.pedidosPage);
                  },
                  titulo: Strings.pedidos,
                  icone: Icons.feed_rounded,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GalleButton(
                  onPress: () {
                    Navigator.of(context).pushNamed(Routes.configuracaoPage);
                  },
                  titulo: Strings.configuracao,
                  icone: Icons.tune_rounded,
                ),
                GalleButton(
                  onPress: () {
                    Navigator.of(context).pushNamed(Routes.catalogoPage);
                  },
                  titulo: Strings.catalogo,
                  icone: Icons.photo_camera_outlined,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GalleButton(
                  onPress: () {
                    Navigator.of(context).pushNamed(Routes.sincronizacaoPage);
                  },
                  titulo: Strings.sincronizacao,
                  icone: Icons.cached,
                ),
                GalleButton(
                  onPress: () {
                    Navigator.of(context).pushNamed(Routes.transmissaoPage);
                  },
                  titulo: Strings.transmissao,
                  icone: Icons.tune_rounded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

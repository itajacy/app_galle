import 'package:flutter/material.dart';
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
              height: 25,
              child: Image.asset(
                'assets/galle_branco_800.png',
                height: 50,
                fit: BoxFit.fill,
              ),
            ),
            // Text(
            //   Strings.empresa,
            //   style: TextStyle(
            //     fontSize: Font.title_24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  Strings.versao,
                  style: TextStyle(fontSize: Font.subtitle_10),
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
              children: <Widget>[
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
                // GalleButton(
                //   onPress: () {
                //     Navigator.of(context).pushNamed(Routes.precosPage);
                //   },
                //   titulo: Strings.precos,
                //   icone: Icons.monetization_on_rounded,
                // ),
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
                    Navigator.of(context).pushNamed(Routes.configuracaoPage);
                  },
                  titulo: Strings.configuracao,
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

import 'package:flutter/material.dart';
import 'package:galle/app/modules/homepage/widgets/home_page_button.dart';
import '../../core/navigation/routes.dart';
import '../../core/navigation/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(''),
      // ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                HomePageButton(
                  onPress: () {
                    Navigator.of(context).pushNamed(Routes.clientesPage);
                  },
                  titulo: Strings.clientes,
                  icone: Icons.people_alt,
                ),
                HomePageButton(
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
                HomePageButton(
                  onPress: () {
                    Navigator.of(context).pushNamed(Routes.precosPage);
                  },
                  titulo: Strings.precos,
                  icone: Icons.monetization_on_rounded,
                ),
                HomePageButton(
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
                HomePageButton(
                  onPress: () {
                    Navigator.of(context).pushNamed(Routes.sincronizacaoPage);
                  },
                  titulo: Strings.sincronizacao,
                  icone: Icons.cached,
                ),
                HomePageButton(
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

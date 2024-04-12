import 'package:flutter/material.dart';

import '../../core/colors_app.dart';
import '../../core/navigation/routes.dart';
import '../../core/space.dart';
import '../../core/strings.dart';
import '../../widgets/galle_button.dart';

class PedidosPage extends StatelessWidget {
  const PedidosPage({super.key});

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
            Icon(Icons.feed_rounded),
            Text(Strings.pedidos),
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
                  Navigator.of(context).pushNamed(Routes.pedidosCadastroPage);
                },
                titulo: Strings.novo,
                icone: Icons.add_shopping_cart_rounded,
              ),
              GalleButton(
                onPress: () {
                  Navigator.of(context).pushNamed(Routes.pedidosConsultaPage);
                },
                titulo: Strings.consulta,
                icone: Icons.search,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

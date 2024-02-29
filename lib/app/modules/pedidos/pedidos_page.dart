import 'package:flutter/material.dart';

import '../../core/space.dart';
import '../../core/strings.dart';
import '../../widgets/galle_button.dart';

class PedidosPage extends StatelessWidget {
  const PedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.monetization_on_rounded),
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
                onPress: () {},
                titulo: Strings.novo,
                icone: Icons.add_box_rounded,
              ),
              GalleButton(
                onPress: () {},
                titulo: Strings.consultar,
                icone: Icons.search,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

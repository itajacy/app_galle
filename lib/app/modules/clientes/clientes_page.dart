import 'package:flutter/material.dart';

import '../../core/navigation/routes.dart';
import '../../core/strings.dart';
import '../../widgets/galle_button.dart';

class ClientesPage extends StatelessWidget {
  const ClientesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.people_alt),
            Text(Strings.clientes),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GalleButton(
                onPress: () {
                  Navigator.of(context).pushNamed(Routes.clientesCadastro);
                },
                titulo: Strings.novo,
                icone: Icons.add_box_rounded,
              ),
              GalleButton(
                onPress: () {
                  Navigator.of(context).pushNamed(Routes.clientesConsulta);
                },
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

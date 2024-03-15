import 'package:flutter/material.dart';

import '../../core/colors_app.dart';
import '../../core/navigation/routes.dart';
import '../../core/space.dart';
import '../../core/strings.dart';
import '../../widgets/galle_button.dart';

class ClientesPage extends StatelessWidget {
  const ClientesPage({super.key});

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
            Icon(Icons.people_alt),
            Text(Strings.clientes),
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
                  Navigator.of(context).pushNamed(Routes.clientesCadastro);
                },
                titulo: Strings.novo,
                icone: Icons.person_add_alt_1,
              ),
              GalleButton(
                onPress: () {
                  Navigator.of(context).pushNamed(Routes.clientesConsulta);
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

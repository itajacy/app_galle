import 'package:flutter/material.dart';
import 'package:galle/app/widgets/galle_button.dart';
import 'package:galle/app/widgets/simple_icon_button.dart';

import '../../core/colors_app.dart';
import '../../core/strings.dart';

class SincronizacaoPage extends StatelessWidget {
  const SincronizacaoPage({super.key});

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
            Icon(Icons.cached),
            Text(Strings.sincronizacao),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SimpleIconButton(
                onPress: () {},
                icone: Icons.sync_outlined,
                iconSize: 30,
                buttonHeight: 60,
                buttonWidth: 200,
                titulo: 'Atualizar Clientes',
              ),
              Column(
                children: [
                  Text("Última Atualização"),
                  Text("15/03/2024 17:15"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SimpleIconButton(
                onPress: () {},
                icone: Icons.sync_outlined,
                iconSize: 30,
                buttonHeight: 60,
                buttonWidth: 200,
                titulo: 'Atualizar Produtos',
              ),
              Column(
                children: [
                  Text("Última Atualização"),
                  Text("10/03/2024 08:07"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SimpleIconButton(
                onPress: () {},
                icone: Icons.sync_outlined,
                iconSize: 30,
                buttonHeight: 60,
                buttonWidth: 200,
                titulo: 'Atualizar Fotos',
              ),
              Column(
                children: [
                  Text("Última Atualização"),
                  Text("13/03/2024 10:25"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SimpleIconButton(
                onPress: () {},
                icone: Icons.sync_outlined,
                iconSize: 30,
                buttonHeight: 60,
                buttonWidth: 200,
                titulo: 'Enviar Pedidos',
              ),
              Column(
                children: [
                  Text("Último Envio"),
                  Text("15/09/2023 17:15"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SimpleIconButton(
                onPress: () {},
                icone: Icons.sync_outlined,
                iconSize: 30,
                buttonHeight: 60,
                buttonWidth: 200,
                titulo: 'Envio por e-mail',
              ),
              Column(
                children: [
                  Text("Último Envio"),
                  Text("01/01/2000 00:00"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

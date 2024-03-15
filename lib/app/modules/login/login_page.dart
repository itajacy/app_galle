import 'package:flutter/material.dart';
import 'package:galle/app/widgets/galle_button.dart';

import '../../core/colors.dart';
import '../../core/navigation/routes.dart';
import '../../core/space.dart';
import '../../core/strings.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();

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
            Icon(Icons.login),
            Text(Strings.login),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(Space.spacing_8),
            child: TextField(
              controller: usuarioController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: Strings.digiteEmail,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Space.spacing_8),
            child: TextField(
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: Strings.digiteSenha,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          GalleButton(
            titulo: Strings.acessar,
            onPress: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.homePage, (route) => false);
            },
            icone: Icons.login,
          ),
        ],
      ),
    );
  }
}

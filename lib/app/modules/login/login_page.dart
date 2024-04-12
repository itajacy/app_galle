import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/widgets/galle_button.dart';

import '../../core/colors_app.dart';
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
      // appBar: AppBar(
      //   backgroundColor: ColorsApp.appBarBackground,
      //   foregroundColor: ColorsApp.appBarForeground,
      //   centerTitle: true,
      //   title: const Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       // Icon(Icons.login),
      //       // Text(Strings.login),
      //     ],
      //   ),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/galle_preto_800.png',
            height: MediaQuery.of(context).size.width > 450
                ? Sizes.sizeH_80
                : Sizes.sizeH_50,
            fit: BoxFit.fill,
          ),
          Column(
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
              SizedBox(
                // height: Space.spacing_15,
                height: MediaQuery.of(context).size.width > 450
                    ? Sizes.sizeH_100
                    : Sizes.sizeH_15,
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
            ],
          ),
          GalleButton(
            titulo: Strings.entrar,
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

import 'package:flutter/material.dart';

import '../../core/navigation/routes.dart';
import '../../core/strings.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: usuarioController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: Strings.digiteEmail, border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: Strings.digiteSenha, border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.homePage, (route) => false);
            },
            child: Text(Strings.acessar),
          ),
        ],
      ),
    );
  }
}

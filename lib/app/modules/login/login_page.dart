import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController usuarioLogin = TextEditingController();
  TextEditingController senhaLogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usuarioLogin,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Digite seu e-mail'),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: senhaLogin,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Digite a Senha'),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/homePage');
              },
              child: Text('ACESSAR'),
            ),
          ],
        ),
      ),
    );
  }
}

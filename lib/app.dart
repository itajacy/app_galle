import 'package:flutter/material.dart';
import 'package:galle/app/modules/homepage/home_page.dart';

import 'app/modules/login/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
      routes: {
        '/loginPage': (context) => LoginPage(),
        '/homePage': (context) => HomePage(),
      },
    );
  }
}

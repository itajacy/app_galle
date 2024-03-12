import 'package:flutter/material.dart';
import 'package:galle/app/modules/catalogo/catalogo_page.dart';
import 'package:galle/app/modules/clientes/cadastro/clientes_cadastro.dart';
import 'package:galle/app/modules/clientes/consulta/clientes_consulta.dart';
import 'package:galle/app/modules/clientes/clientes_page.dart';
import 'package:galle/app/modules/configuracao/configuracao_page.dart';
import 'package:galle/app/modules/homepage/home_page.dart';
import 'package:galle/app/modules/pedidos/cadastro/pedidos_cadastro.dart';
import 'package:galle/app/modules/pedidos/cadastro/pedidos_cadastro_itens.dart';
import 'package:galle/app/modules/pedidos/consulta/pedidos_consulta.dart';
import 'package:galle/app/modules/pedidos/pedidos_page.dart';
import 'package:galle/app/modules/precos/precos_page.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_page.dart';

import 'app/core/navigation/routes.dart';
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
        Routes.loginPage: (context) => LoginPage(),
        Routes.homePage: (context) => HomePage(),
        Routes.clientesPage: (context) => ClientesPage(),
        Routes.pedidosPage: (context) => PedidosPage(),
        Routes.precosPage: (context) => PrecosPage(),
        Routes.catalogoPage: (context) => CatalogoPage(),
        Routes.sincronizacaoPage: (context) => SincronizacaoPage(),
        Routes.configuracaoPage: (context) => ConfiguracaoPage(),
        Routes.clientesCadastro: (context) => ClientesCadastro(),
        Routes.clientesConsulta: (context) => ClientesConsulta(),
        Routes.pedidosCadastro: (context) => PedidosCadastro(),
        Routes.pedidosConsulta: (context) => PedidosConsulta(),
        Routes.pedidosCadastroItens: (context) => PedidosCadastroItens(),

      },
    );
  }
}

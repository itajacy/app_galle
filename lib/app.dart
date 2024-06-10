import 'package:flutter/material.dart';
import 'package:galle/app/modules/catalogo/catalogo_page.dart';
import 'package:galle/app/modules/clientes/cadastro/clientes_cadastro_page.dart';
import 'package:galle/app/modules/clientes/consulta/clientes_consulta_page.dart';
import 'package:galle/app/modules/clientes/clientes_page.dart';
import 'package:galle/app/modules/configuracao/configuracao_amazon_page.dart';
import 'package:galle/app/modules/configuracao/configuracao_ftp_Page.dart';
import 'package:galle/app/modules/configuracao/configuracao_page.dart';
import 'package:galle/app/modules/configuracao/configuracao_tela_Page.dart';
import 'package:galle/app/modules/homepage/home_page.dart';
import 'package:galle/app/modules/pedidos/cadastro/pedidos_cadastro_page.dart';
import 'package:galle/app/modules/pedidos/cadastro/itens/pedidos_cadastro_itens_page.dart';
import 'package:galle/app/modules/pedidos/consulta/pedidos_consulta_page.dart';
import 'package:galle/app/modules/pedidos/pedidos_page.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_page.dart';

import 'app/core/navigation/routes.dart';
import 'app/modules/login/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        Routes.catalogoPage: (context) => CatalogoPage(),
        Routes.sincronizacaoPage: (context) => SincronizacaoPage(),
        Routes.configuracaoPage: (context) => ConfiguracaoPage(),
        Routes.clientesCadastroPage: (context) => ClientesCadastroPage(),
        Routes.clientesConsultaPage: (context) => ClientesConsultaPage(),
        Routes.pedidosCadastroPage: (context) => PedidosCadastroPage(),
        Routes.pedidosConsultaPage: (context) => PedidosConsultaPage(),
        Routes.pedidosCadastroItensPage: (context) =>
            PedidosCadastroItensPage(),
        Routes.configuracaoFtpPage: (context) => ConfiguracaoFtpPage(),
        Routes.configuracaoAmazonPage: (context) => ConfiguracaoAmazonPage(),
        Routes.configuracaoTelaPage: (context) => ConfiguracaoTelaPage(),
      },
    );
  }
}

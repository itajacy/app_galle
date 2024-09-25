//* alterado em 24/09/24
import 'package:flutter/material.dart';
import 'package:galle/app/modules/catalogo/catalogo_page.dart';
import 'package:galle/app/modules/clientes/cadastro/clientes_cadastro_page.dart';
import 'package:galle/app/modules/clientes/consulta/clientes_consulta_page.dart';
import 'package:galle/app/modules/clientes/clientes_page.dart';
import 'package:galle/app/modules/clientes/detalhes/clientes_consulta_detalhes_page.dart';
import 'package:galle/app/modules/configuracao/configuracao_amazon_page.dart';
import 'package:galle/app/modules/configuracao/configuracao_ftp_page.dart';
import 'package:galle/app/modules/configuracao/configuracao_page.dart';
import 'package:galle/app/modules/configuracao/configuracao_tela_page.dart';
import 'package:galle/app/modules/homepage/home_page.dart';
import 'package:galle/app/modules/pedidos/cadastro/pedidos_cadastro_page.dart';
import 'package:galle/app/modules/pedidos/cadastro/itens/pedidos_cadastro_itens_page.dart';
import 'package:galle/app/modules/pedidos/consulta/pedidos_consulta_page.dart';
import 'package:galle/app/modules/pedidos/pedidos_page.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_page.dart';
import 'package:get/get.dart';

import 'app/core/navigation/routes.dart';
import 'app/modules/clientes/detalhes/clientes_alteracao_detalhes_page.dart';
import 'app/modules/login/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
      routes: {
        Routes.loginPage: (context) => LoginPage(),
        Routes.homePage: (context) => const HomePage(),
        Routes.clientesPage: (context) => const ClientesPage(),
        Routes.pedidosPage: (context) => const PedidosPage(),
        Routes.catalogoPage: (context) => CatalogoPage(),
        Routes.sincronizacaoPage: (context) => const SincronizacaoPage(),
        Routes.configuracaoPage: (context) => const ConfiguracaoPage(),
        Routes.clientesCadastroPage: (context) => const ClientesCadastroPage(),
        Routes.clientesConsultaPage: (context) => ClientesConsultaPage(),
        Routes.pedidosCadastroPage: (context) => PedidosCadastroPage(),
        Routes.pedidosConsultaPage: (context) => const PedidosConsultaPage(),
        Routes.pedidosCadastroItensPage: (context) =>
            PedidosCadastroItensPage(),
        Routes.configuracaoFtpPage: (context) => ConfiguracaoFtpPage(),
        Routes.configuracaoAmazonPage: (context) =>
            const ConfiguracaoAmazonPage(),
        Routes.configuracaoTelaPage: (context) => const ConfiguracaoTelaPage(),
        Routes.clientesConsultaDetalhesPage: (context) =>
            ClientesConsultaDetalhesPage(),
        Routes.clientesAlteracaoDetalhesPage: (context) =>
            const ClientesAlteracaoDetalhesPage(),
      },
    );
  }
}

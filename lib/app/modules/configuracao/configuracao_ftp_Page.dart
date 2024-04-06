import 'package:flutter/material.dart';

import '../../core/colors_app.dart';
import '../../core/sizes.dart';
import '../../core/space.dart';
import '../../core/strings.dart';
import '../clientes/widgets/clientes_button.dart';

class ConfiguracaoFtpPage extends StatelessWidget {
  ConfiguracaoFtpPage({super.key});

  final enderecoSincronizacaoController = TextEditingController();
  final enderecoImagensController = TextEditingController();
  final usuarioFTPController = TextEditingController();
  final senhaFTPController = TextEditingController();

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
            Icon(Icons.filter_drama),
            Text(Strings.configuracaoFtp),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Space.spacing_12,
            ),
            Container(
              height: Sizes.sizeH_40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClientesButton(
                      onPress: () {},
                      titulo: Strings.cancelar,
                      icone: Icons.cancel_presentation_outlined),
                  ClientesButton(
                    onPress: () {},
                    titulo: Strings.salvar,
                    icone: Icons.check_box,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Space.spacing_12,
            ),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_12),
              child: TextField(
                controller: enderecoSincronizacaoController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: Strings.enderecoSincronizacao,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_12),
              child: TextField(
                controller: enderecoImagensController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: Strings.enderecoImagens,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_12),
              child: TextField(
                controller: usuarioFTPController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: Strings.usuarioDeFTP,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_12),
              child: TextField(
                controller: senhaFTPController,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: Strings.senhaDeFTP,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:galle/app/core/navigation/routes.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/core/space.dart';
import 'package:galle/app/widgets/simple_icon_button.dart';

import '../../../core/cores.dart';
import '../../../core/font.dart';
import '../../../core/strings.dart';

class ClientesConsulta extends StatelessWidget {
  ClientesConsulta({super.key});

  final clienteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.appBarBackground,
        foregroundColor: Cores.appBarForeground,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.search),
            Text(Strings.clientesConsulta),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Space.spacing_8,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(Space.spacing_8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: clienteController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.cliente,
                        labelStyle: TextStyle(fontSize: Font.title_24),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SimpleIconButton(
                    onPress: () {
                      Navigator.of(context).pushNamed(Routes.clientesCadastro);
                    },
                    icone: Icons.person_add_alt_1,
                    size: Sizes.sizeH_40,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Space.spacing_8,
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(),
          ),
        ],
      ),
    );
  }
}

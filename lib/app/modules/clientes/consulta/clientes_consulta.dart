import 'package:flutter/material.dart';
import 'package:galle/app/core/colors_app.dart';
import 'package:galle/app/core/navigation/routes.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/core/space.dart';
import 'package:galle/app/widgets/general_icon_button.dart';

import '../../../core/font.dart';
import '../../../core/strings.dart';

class ClientesConsulta extends StatelessWidget {
  ClientesConsulta({super.key});

  final clienteController = TextEditingController();
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
                    width: Sizes.sizeW_300,
                    child: TextField(
                      controller: clienteController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.cliente,
                        labelStyle: TextStyle(fontSize: Font.title_24),
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                  ),
                  GeneralIconButton(
                    onPress: () {
                      Navigator.of(context).pushNamed(Routes.clientesCadastro);
                    },
                    icone: Icons.person_add_alt_1,
                    iconSize: Sizes.sizeH_35,
                    buttonWidth: Sizes.sizeW_64,
                    buttonHeight: Sizes.sizeH_55,
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

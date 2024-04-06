import 'package:flutter/material.dart';
import 'package:galle/app/modules/clientes/widgets/clientes_button.dart';
import 'package:galle/app/modules/clientes/widgets/clientes_uf_dropdown.dart';
import '../../../core/colors_app.dart';
import '../../../core/font.dart';
import '../../../core/sizes.dart';
import '../../../core/space.dart';
import '../../../core/strings.dart';
import '../widgets/pessoafj_button.dart';

class ClientesCadastroPage extends StatelessWidget {
  ClientesCadastroPage({super.key});

  final nomeFantasiaController = TextEditingController();
  final razaoSocialController = TextEditingController();
  final pessoaFJController = TextEditingController();
  final cnpjCpfController = TextEditingController();
  final ieRgController = TextEditingController();
  final contatoController = TextEditingController();
  final emailController = TextEditingController();
  final foneCom1Controller = TextEditingController();
  final foneCom2Controller = TextEditingController();
  final foneResController = TextEditingController();
  final faxController = TextEditingController();
  final principalUfController = TextEditingController();
  final principalCidadeController = TextEditingController();
  final principalEnderecoController = TextEditingController();
  final principalComplementoController = TextEditingController();
  final principalBairroController = TextEditingController();
  final principalCepController = TextEditingController();
  final entregaUfController = TextEditingController();
  final entregaCidadeController = TextEditingController();
  final entregaEnderecoController = TextEditingController();
  final entregaComplementoController = TextEditingController();
  final entregaBairroController = TextEditingController();
  final entregaCepController = TextEditingController();

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
            Icon(Icons.person_add_alt_1),
            Text(Strings.clientesCadastro),
          ],
        ),
      ),
      body: Column(
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
            height: Space.spacing_8,
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: nomeFantasiaController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.nomeFantasia,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: razaoSocialController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.razaoSocial,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Text(
                    Strings.pessoaFJ,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Font.title_18),
                  ),
                  //!
                  PessoafjButton(),

                  //!
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: cnpjCpfController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.cnpjCpf,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: ieRgController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.ieRg,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: contatoController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.contato,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: Strings.email,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: foneCom1Controller,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneCom1,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: foneCom2Controller,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneCom2,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: foneResController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneRes,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: Text(
                      Strings.enderecoPrincipal,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: Row(
                      children: [
                        Text(
                          Strings.uf,
                          style: TextStyle(fontSize: Font.title_18),
                        ),
                        SizedBox(
                          width: Space.spacing_8,
                        ),
                        ClientesUfDropdown(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: principalCidadeController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.cidade,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: principalEnderecoController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.endereco,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: principalComplementoController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.complemento,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: principalBairroController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.bairro,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: principalCepController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.cep,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: Text(
                      Strings.enderecoEntrega,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Font.title_18,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: ClientesButton(
                      onPress: () {},
                      titulo: Strings.copiarPrincipal,
                      icone: Icons.copy,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: Row(
                      children: [
                        Text(
                          Strings.uf,
                          style: TextStyle(fontSize: Font.title_18),
                        ),
                        SizedBox(
                          width: Space.spacing_8,
                        ),
                        ClientesUfDropdown(),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: entregaCidadeController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.cidade,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: entregaEnderecoController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.endereco,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: entregaComplementoController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.complemento,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: entregaBairroController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.bairro,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: entregaCepController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.cep,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

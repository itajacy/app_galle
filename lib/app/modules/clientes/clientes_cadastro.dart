import 'package:flutter/material.dart';

import '../../core/strings.dart';

class ClientesCadastro extends StatelessWidget {
  ClientesCadastro({super.key});

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
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.add_box_rounded),
            Text(Strings.clientesCadastro),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nomeFantasiaController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: Strings.nomeFantasia),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: razaoSocialController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: Strings.razaoSocial),
            ),
            const SizedBox(height: 10),
            Text(Strings.pessoaFJ),
            Text('Física   /   Jurídica'),
            const SizedBox(height: 10),
            TextField(
              controller: cnpjCpfController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: Strings.cnpjCpf),
            ),
            TextField(
              controller: ieRgController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: Strings.ieRg),
            ),
            TextField(
              controller: contatoController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: Strings.contato),
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: Strings.email),
            ),
            TextField(
              controller: foneCom1Controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: Strings.foneCom1),
            ),
            TextField(
              controller: foneCom2Controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: Strings.foneCom2),
            ),
            TextField(
              controller: foneResController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: Strings.foneRes),
            ),
            Text(
              'Endereço Principal',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextField(
              controller: principalUfController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: Strings.uf),
            ),
            TextField(
              controller: principalCidadeController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: Strings.cidade),
            ),
            TextField(
              controller: principalEnderecoController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: Strings.endereco),
            ),
            TextField(
              controller: principalComplementoController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: Strings.complemento),
            ),
            TextField(
              controller: principalBairroController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: Strings.bairro),
            ),
            TextField(
              controller: principalCepController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: Strings.cep),
            ),
            Text(
              'Endereço de Entrega',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text('COPIAR PRINCIPAL'),
            TextField(
              controller: entregaUfController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: Strings.uf),
            ),
            TextField(
              controller: entregaCidadeController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: Strings.cidade),
            ),
            TextField(
              controller: entregaEnderecoController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: Strings.endereco),
            ),
            TextField(
              controller: entregaComplementoController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: Strings.complemento),
            ),
            TextField(
              controller: entregaBairroController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: Strings.bairro),
            ),
            TextField(
              controller: entregaCepController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: Strings.cep),
            ),
          ],
        ),
      ),
    );
  }
}

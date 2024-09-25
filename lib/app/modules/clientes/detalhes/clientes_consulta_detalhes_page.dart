//* alterado em 24/09/24
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:galle/app/modules/clientes/widgets/lower_case_text_formatter.dart';
import '../../../core/colors_app.dart';
import '../../../core/font.dart';
import '../../../core/space.dart';
import '../../../core/strings.dart';
import '../../../models/cliente.dart';
import '../widgets/upper_case_text_formatter.dart';

class ClientesConsultaDetalhesPage extends StatefulWidget {
  Cliente? cliente;
  ClientesConsultaDetalhesPage({super.key, this.cliente});

  @override
  State<ClientesConsultaDetalhesPage> createState() =>
      _ClientesConsultaDetalhesPageState();
}

class _ClientesConsultaDetalhesPageState
    extends State<ClientesConsultaDetalhesPage> {
  final nomeFantasiaController = TextEditingController();
  final razaoSocialController = TextEditingController();
  final pessoaFJController = TextEditingController();
  final cnpjCpfController = TextEditingController();
  final ieRgController = TextEditingController();
  final contatoController = TextEditingController();
  final emailController = TextEditingController();
  final foneCom1Controller = TextEditingController();
  final foneCom2Controller = TextEditingController();
  final foneCelController = TextEditingController();
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

  bool? salvo;

  late FocusNode focusNomeFantasia;

  String mascaraCpfCnpj = '999.999.999-99';
  String mascaraRgIe = '99.999.999-N';

  @override
  void initState() {
    super.initState();
    focusNomeFantasia = FocusNode();
  }

  @override
  void dispose() {
    nomeFantasiaController.dispose();
    razaoSocialController.dispose();
    pessoaFJController.dispose();
    cnpjCpfController.dispose();
    ieRgController.dispose();
    contatoController.dispose();
    emailController.dispose();
    foneCom1Controller.dispose();
    foneCom2Controller.dispose();
    foneCelController.dispose();
    foneResController.dispose();
    faxController.dispose();
    principalUfController.dispose();
    principalCidadeController.dispose();
    principalEnderecoController.dispose();
    principalComplementoController.dispose();
    principalBairroController.dispose();
    principalCepController.dispose();
    entregaUfController.dispose();
    entregaCidadeController.dispose();
    entregaEnderecoController.dispose();
    entregaComplementoController.dispose();
    entregaBairroController.dispose();
    entregaCepController.dispose();
    focusNomeFantasia.dispose();
    super.dispose();
  }

  // void _limpaControllers() {
  //   nomeFantasiaController.clear();
  //   razaoSocialController.clear();
  //   pessoaFJController.clear();
  //   cnpjCpfController.clear();
  //   ieRgController.clear();
  //   contatoController.clear();
  //   emailController.clear();
  //   foneCom1Controller.clear();
  //   foneCom2Controller.clear();
  //   foneCelController.clear();
  //   foneResController.clear();
  //   faxController.clear();
  //   principalUfController.clear();
  //   principalCidadeController.clear();
  //   principalEnderecoController.clear();
  //   principalComplementoController.clear();
  //   principalBairroController.clear();
  //   principalCepController.clear();
  //   entregaUfController.clear();
  //   entregaCidadeController.clear();
  //   entregaEnderecoController.clear();
  //   entregaComplementoController.clear();
  //   entregaBairroController.clear();
  //   entregaCepController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    //! pegando o argumento da rota do Navigator
    final argument =
        (ModalRoute.of(context)?.settings.arguments ?? <Cliente>{}) as Cliente;
    nomeFantasiaController.text = argument.nomeFantasia!;
    razaoSocialController.text = argument.razaoSocial!;
    pessoaFJController.text = argument.tipoPessoa!;
    // String tipoPessoa = argument.tipoPessoa!;
    cnpjCpfController.text = argument.cNPJCPF!;
    ieRgController.text = argument.iERG!;
    contatoController.text = argument.contato!;
    emailController.text = argument.email!;
    foneCom1Controller.text = argument.fone1!;
    foneCom2Controller.text = argument.fone2!;
    foneCelController.text = argument.foneCel!;
    foneResController.text = argument.foneRes!;
    faxController.text = argument.fax!;
    principalUfController.text = argument.pUF!;
    principalCidadeController.text = argument.pCidade!;
    principalEnderecoController.text = argument.pEndereco!;
    principalComplementoController.text = argument.pComplemento!;
    principalBairroController.text = argument.pBairro!;
    principalCepController.text = argument.pCEP!;
    entregaUfController.text = argument.eUF!;
    entregaCidadeController.text = argument.eCidade!;
    entregaEnderecoController.text = argument.eEndereco!;
    entregaComplementoController.text = argument.eComplemento!;
    entregaBairroController.text = argument.eBairro!;
    entregaCepController.text = argument.eCEP!;

//!===========================================================
    return Scaffold(
      backgroundColor: ColorsApp.screenBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsApp.appBarBackground,
        foregroundColor: ColorsApp.appBarForeground,
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.lock_person_outlined),
            Text(Strings.clientesConsulta),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: Space.spacing_12,
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      focusNode: focusNomeFantasia,
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: nomeFantasiaController,
                      readOnly: true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: Strings.nomeFantasiaConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: razaoSocialController,
                      readOnly: true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: Strings.razaoSocialConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        TextInputMask(
                          mask: [mascaraCpfCnpj],
                          reverse: false,
                        )
                      ],
                      controller: cnpjCpfController,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: (pessoaFJController.text == "F")
                            ? Strings.cpf
                            : Strings.cnpj,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        TextInputMask(
                          mask: [mascaraRgIe],
                          reverse: false,
                        ),
                      ],
                      controller: ieRgController,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: (pessoaFJController.text == "F")
                            ? Strings.rg
                            : Strings.ie,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: contatoController,
                      readOnly: true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: Strings.contatoConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      //!  FORMATAÇÀO DO E-MAIL
                      inputFormatters: [
                        LowerCaseTextFormatter(),
                      ],
                      controller: emailController,
                      readOnly: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: Strings.emailConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      //! fone
                      inputFormatters: [
                        TextInputMask(
                            mask: ['(99) 9999-9999', '(99) 99999-9999'],
                            reverse: false)
                      ],
                      controller: foneCom1Controller,
                      readOnly: true,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: Strings.foneCom1Consulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        TextInputMask(
                            mask: ['(99) 9999-9999', '(99) 99999-9999'],
                            reverse: false),
                      ],
                      controller: foneCom2Controller,
                      readOnly: true,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: Strings.foneCom2Consulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        TextInputMask(
                            mask: ['(99) 9999-9999', '(99) 99999-9999'],
                            reverse: false),
                      ],
                      controller: foneCelController,
                      readOnly: true,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: Strings.foneCelConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        TextInputMask(
                            mask: ['(99) 9999-9999', '(99) 99999-9999'],
                            reverse: false),
                      ],
                      controller: foneResController,
                      readOnly: true,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: Strings.foneResConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        TextInputMask(
                            mask: ['(99) 9999-9999', '(99) 99999-9999'],
                            reverse: false),
                      ],
                      controller: faxController,
                      readOnly: true,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: Strings.faxConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(Space.spacing_8),
                    child: Text(
                      Strings.enderecoPrincipal,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.all(Space.spacing_8),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [],
                  //   ),
                  // ),
                  //! UF Principal
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: principalUfController,
                      readOnly: true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: Strings.estadoConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: principalCidadeController,
                      readOnly: true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: Strings.cidadeConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: principalEnderecoController,
                      readOnly: true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: Strings.enderecoConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: principalComplementoController,
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: Strings.complementoConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: principalBairroController,
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: Strings.bairroConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        TextInputMask(
                          mask: ['99999-999'],
                          reverse: false,
                        ),
                      ],
                      controller: principalCepController,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: Strings.cepConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: Space.spacing_8,
                    ),
                    child: Text(
                      Strings.enderecoEntrega,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Font.title_18,
                      ),
                    ),
                  ),

                  // const Padding(
                  //   padding: EdgeInsets.all(Space.spacing_8),
                  //   child: Row(
                  //     children: [],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: entregaUfController,
                      readOnly: true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: Strings.estadoConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: entregaCidadeController,
                      readOnly: true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: Strings.cidadeConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: entregaEnderecoController,
                      readOnly: true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: Strings.enderecoConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: entregaComplementoController,
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: Strings.complementoConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: entregaBairroController,
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: Strings.bairroConsulta,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        TextInputMask(
                          mask: ['99999-999'],
                          reverse: false,
                        ),
                      ],
                      controller: entregaCepController,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: Strings.cepConsulta,
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

import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:galle/app/modules/clientes/widgets/clientes_button.dart';
import 'package:galle/app/modules/clientes/widgets/clientes_uf_dropdown.dart';
import 'package:galle/app/modules/clientes/widgets/lower_case_text_formatter.dart';
import 'package:get/get.dart';
import '../../../core/colors_app.dart';
import '../../../core/font.dart';
import '../../../core/sizes.dart';
import '../../../core/space.dart';
import '../../../core/strings.dart';
import '../../../models/cliente.dart';
import '../widgets/pessoafj_button.dart';
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

//!===============================================
  @override
  void initState() {
    super.initState();
    focusNomeFantasia = FocusNode();
    // print('====================================');
    // print(nomeFantasiaController.text);
    // print('é == null --> ${(widget.cliente == null)}');
    // print(widget.cliente.toString());
    // print('====================================');

    // nomeFantasiaController.text = widget.cliente!.nomeFantasia!;
    // razaoSocialController.text = widget.cliente!.razaoSocial!;
    // pessoaFJController.text = widget.cliente!.tipoPessoa!;
    // cnpjCpfController.text = widget.cliente!.cNPJCPF!;
    // ieRgController.text = widget.cliente!.iERG!;
    // contatoController.text = widget.cliente!.contato!;
    // emailController.text = widget.cliente!.email!;
    // foneCom1Controller.text = widget.cliente!.fone1!;
    // foneCom2Controller.text = widget.cliente!.fone2!;
    // foneCelController.text = widget.cliente!.foneCel!;
    // foneResController.text = widget.cliente!.foneRes!;
    // faxController.text = widget.cliente!.fax!;
    // principalUfController.text = widget.cliente!.pUF!;
    // principalCidadeController.text = widget.cliente!.pCidade!;
    // principalEnderecoController.text = widget.cliente!.pEndereco!;
    // principalComplementoController.text = widget.cliente!.pComplemento!;
    // principalBairroController.text = widget.cliente!.pBairro!;
    // principalCepController.text = widget.cliente!.pCEP!;
    // entregaUfController.text = widget.cliente!.eUF!;
    // entregaCidadeController.text = widget.cliente!.eCidade!;
    // entregaEnderecoController.text = widget.cliente!.eEndereco!;
    // entregaComplementoController.text = widget.cliente!.eComplemento!;
    // entregaBairroController.text = widget.cliente!.eBairro!;
    // entregaCepController.text = widget.cliente!.eCEP!;
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

  void _limpaControllers() {
    nomeFantasiaController.clear();
    razaoSocialController.clear();
    pessoaFJController.clear();
    cnpjCpfController.clear();
    ieRgController.clear();
    contatoController.clear();
    emailController.clear();
    foneCom1Controller.clear();
    foneCom2Controller.clear();
    foneCelController.clear();
    foneResController.clear();
    faxController.clear();
    principalUfController.clear();
    principalCidadeController.clear();
    principalEnderecoController.clear();
    principalComplementoController.clear();
    principalBairroController.clear();
    principalCepController.clear();
    entregaUfController.clear();
    entregaCidadeController.clear();
    entregaEnderecoController.clear();
    entregaComplementoController.clear();
    entregaBairroController.clear();
    entregaCepController.clear();
  }

  @override
  Widget build(BuildContext context) {
    //! pegando o argumento da rota do Navigator
    final argument =
        (ModalRoute.of(context)?.settings.arguments ?? <Cliente>{}) as Cliente;
    print(argument.toString());
    nomeFantasiaController.text = argument.nomeFantasia!;
    razaoSocialController.text = argument.razaoSocial!;
    pessoaFJController.text = argument.tipoPessoa!;
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
          SizedBox(
            height: Sizes.sizeH_40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClientesButton(
                    onPress: () {
                      _limpaControllers();
                      Navigator.of(context).pop();
                    },
                    titulo: Strings.cancelar,
                    icone: Icons.cancel_presentation_outlined),
                ClientesButton(
                  onPress: () async {},
                  titulo: Strings.salvar,
                  icone: Icons.check_box,
                ),
              ],
            ),
          ),
          const SizedBox(
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
                      focusNode: focusNomeFantasia,
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: nomeFantasiaController,
                      readOnly: true,
                      // onChanged: clientesCadastroController.setNomeFantasia,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.nomeFantasia,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.nomeFantasiaError,
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
                      // onChanged: clientesCadastroController.setRazaoSocial,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.razaoSocial,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.razaoSocialError,
                      ),
                    ),
                  ),
                  const Text(
                    Strings.pessoaFJ,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Font.title_18,
                    ),
                  ),
                  PessoafjButton(
                    pessoa: (pessoaFouJ) {
                      pessoaFJController.text = pessoaFouJ;
                      if (pessoaFouJ == "F") {
                        mascaraCpfCnpj = '999.999.999-99';
                        mascaraRgIe = '99.999.999-N';
                      } else {
                        mascaraCpfCnpj = '99.999.999/9999-99';
                        mascaraRgIe = '999.999.999.999';
                      }
                    },
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
                      // onChanged: clientesCadastroController.setCnpjCpf,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.cnpjCpf,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.cnpjCpfError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        TextInputMask(
                          //! VER COMO ACEITAR A LETRA DO RG MAIUSCULA
                          mask: [mascaraRgIe],
                          reverse: false,
                        ),
                      ],
                      controller: ieRgController,
                      readOnly: true,
                      // onChanged: clientesCadastroController.setIeRg,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.ieRg,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.iERGError,
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
                      // onChanged: clientesCadastroController.setContato,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.contato,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.contatoError,
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
                      // onChanged: clientesCadastroController.setEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: Strings.email,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.emailError,
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
                      // onChanged: clientesCadastroController.setFone1,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneCom1,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.fone1Error,
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
                      // onChanged: clientesCadastroController.setFone2,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneCom2,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.fone2Error,
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
                      // onChanged: clientesCadastroController.setFoneCel,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneCel,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.fone2Error,
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
                      // onChanged: clientesCadastroController.setFoneRes,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneRes,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.foneResError,
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
                      // onChanged: clientesCadastroController.setFax,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.fax,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.faxError,
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
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child:
                        //! Widget para selecionar o Estado(UF principal)
                        Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // GetBuilder<ClientesCadastroController>(
                        //   builder: (_) {
                        //     return ClientesUfDropdown(
                        //       ufRetorno: (uf) {
                        //         principalUfController.text = uf;
                        //         // clientesCadastroController.setpUF(uf);
                        //       },
                        //       msgUFError: clientesCadastroController.pUFError,
                        //       ufController: principalUfController,
                        //     );
                        //   },
                        // ),
                      ],
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
                      // onChanged: clientesCadastroController.setpCidade,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.cidade,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.pCidadeError,
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
                      // onChanged: clientesCadastroController.setpEndereco,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.endereco,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.pEnderecoError,
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
                      // onChanged: clientesCadastroController.setpComplemento,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.complemento,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.pComplementoError,
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
                      // onChanged: clientesCadastroController.setpBairro,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.bairro,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.pBairroError,
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
                      // onChanged: clientesCadastroController.setpCEP,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.cep,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.pCEPError,
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
                  // Padding(
                  //   padding: const EdgeInsets.all(Space.spacing_8),

                  //   //! botao copiarEnderecoPrincipal
                  //   child: ClientesButton(
                  //     onPress: () {},
                  //     titulo: Strings.copiarPrincipal,
                  //     icone: Icons.copy,
                  //   ),
                  // ),
                  const Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: Row(
                      children: [
                        //! Widget para selecionar o Estado(UF ENTREGA)

                        // GetBuilder<ClientesCadastroController>(
                        //   builder: (_) {
                        //     return ClientesUfDropdown(
                        //       ufRetorno: (ufEntrega) {
                        //         entregaUfController.text = ufEntrega;
                        //         // clientesCadastroController.seteUF(ufEntrega);
                        //       },
                        //       // msgUFError: clientesCadastroController.eUFError,
                        //       ufController: entregaUfController,
                        //     );
                        //   },
                        // ),
                      ],
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
                      // onChanged: clientesCadastroController.seteCidade,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.cidade,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.eCidadeError,
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
                      // onChanged: clientesCadastroController.seteEndereco,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.endereco,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.eEnderecoError,
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
                      // onChanged: clientesCadastroController.seteComplemento,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.complemento,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.eEnderecoError,
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
                      // onChanged: clientesCadastroController.seteBairro,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.bairro,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.eBairroError,
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
                      // onChanged: clientesCadastroController.seteCEP,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.cep,
                        border: const OutlineInputBorder(),
                        // errorText: clientesCadastroController.eCEPError,
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

//* alterado em 24/09/24
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
import 'clientes_alteracao_controller.dart';

class ClientesAlteracaoDetalhesPage extends StatefulWidget {
  const ClientesAlteracaoDetalhesPage({super.key});

  @override
  State<ClientesAlteracaoDetalhesPage> createState() =>
      _ClientesAlteracaoDetalhesPageState();
}

class _ClientesAlteracaoDetalhesPageState
    extends State<ClientesAlteracaoDetalhesPage> {
  ClientesAlteracaoController clientesAlteracaoController =
      Get.put(ClientesAlteracaoController());

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

  String pessoa = 'F';
  bool fj = false;

//!  VER RegExp

//*  Abaixo um RegExp para validação de e-mail

// return RegExp(
//                 r'^(([^<>()[\]\\.,&";:\s@\"]+(\.[^<>()[\]\\.,&";:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')

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

  void _limpaControllers() {
    // clientesCadastroController.cliente.clienteId == null;
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
    clientesAlteracaoController.cliente.clienteId = argument.clienteId;
    clientesAlteracaoController.cliente.dispositivoId = argument.dispositivoId;
    clientesAlteracaoController.cliente.clienteIdMob = argument.clienteIdMob;
    clientesAlteracaoController.cliente.clienteIdInt = argument.clienteIdInt;
    clientesAlteracaoController.cliente.ativo = argument.ativo;

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


    return Scaffold(
      backgroundColor: ColorsApp.screenBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsApp.appBarBackground,
        foregroundColor: ColorsApp.appBarForeground,
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.person_2_outlined),
            Text(Strings.clientesAlteracao),
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
                  onPress: () async {
                    clientesAlteracaoController.cliente.contato =
                        contatoController.text;
                    clientesAlteracaoController.cliente.nomeFantasia =
                        nomeFantasiaController.text;

                    clientesAlteracaoController.cliente.razaoSocial =
                        razaoSocialController.text;
                    clientesAlteracaoController.cliente.tipoPessoa =
                        pessoaFJController.text;
                    clientesAlteracaoController.cliente.cNPJCPF =
                        cnpjCpfController.text;
                    clientesAlteracaoController.cliente.iERG =
                        ieRgController.text;
                    clientesAlteracaoController.cliente.contato =
                        contatoController.text;
                    clientesAlteracaoController.cliente.email =
                        emailController.text;

                    clientesAlteracaoController.cliente.fone1 =
                        foneCom1Controller.text;
                    clientesAlteracaoController.cliente.fone2 =
                        foneCom2Controller.text;
                    clientesAlteracaoController.cliente.foneCel =
                        foneCelController.text;
                    clientesAlteracaoController.cliente.foneRes =
                        foneResController.text;
                    clientesAlteracaoController.cliente.fax =
                        faxController.text;

                    clientesAlteracaoController.cliente.pUF =
                        principalUfController.text;
                    clientesAlteracaoController.cliente.pCidade =
                        principalCidadeController.text;
                    clientesAlteracaoController.cliente.pEndereco =
                        principalEnderecoController.text;
                    clientesAlteracaoController.cliente.pComplemento =
                        principalComplementoController.text;
                    clientesAlteracaoController.cliente.pBairro =
                        principalBairroController.text;
                    clientesAlteracaoController.cliente.pCEP =
                        principalCepController.text;

                    clientesAlteracaoController.cliente.eUF =
                        entregaUfController.text;

                    clientesAlteracaoController.cliente.eCidade =
                        entregaCidadeController.text;
                    clientesAlteracaoController.cliente.eEndereco =
                        entregaEnderecoController.text;
                    clientesAlteracaoController.cliente.eComplemento =
                        entregaComplementoController.text;
                    clientesAlteracaoController.cliente.eBairro =
                        entregaBairroController.text;
                    clientesAlteracaoController.cliente.eCEP =
                        entregaCepController.text;

                    var isSave = await clientesAlteracaoController
                        .updateCliente(isSave: salvo);
                    if (isSave) {
                      Get.showSnackbar(
                        const GetSnackBar(
                          backgroundColor: ColorsApp.appBarBackground,
                          titleText: Text(
                            'Cliente alterado com sucesso!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsApp.textoForegYellow,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: Font.title_20,
                            ),
                          ),
                          message: 'Deus te abençoe, e que você venda muito',
                          duration: Duration(seconds: 3),
                        ),
                      );

                      _limpaControllers();
                      // focusNomeFantasia.requestFocus();
                      // Navigator.pushNamed(context, '/clientesConsultaPage');
                      // Navigator.pushNamed(context, '/clientesPage');
                      Navigator.of(context).pop(true);
                    } else {
                      Get.showSnackbar(
                        const GetSnackBar(
                          backgroundColor: ColorsApp.errorBackground,
                          titleText: Text(
                            'ERRO: Cliente NÃO foi alterado ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsApp.textoForegYellow,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: Font.title_20,
                            ),
                          ),
                          message:
                              'Verifique e preencha os dados que estão faltando.',
                          duration: Duration(seconds: 7),
                        ),
                      );
                    }
                  },
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
                      onChanged: clientesAlteracaoController.setNomeFantasia,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.nomeFantasia,
                        border: const OutlineInputBorder(),
                        errorText:
                            clientesAlteracaoController.nomeFantasiaError,
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
                      onChanged: clientesAlteracaoController.setRazaoSocial,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.razaoSocial,
                        border: const OutlineInputBorder(),
                        errorText: clientesAlteracaoController.razaoSocialError,
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
                  GetBuilder<ClientesAlteracaoController>(builder: (_) {
                    return PessoafjButton(
                      pessoa: (pessoaFouJ) {
                        pessoaFJController.text = pessoaFouJ;
                        if (fj) {
                          setState(() {
                            pessoa = pessoaFouJ;
                          });
                        }
                        if (pessoaFouJ == "F") {
                          mascaraCpfCnpj = '999.999.999-99';
                          mascaraRgIe = '99.999.999-N';
                        } else {
                          mascaraCpfCnpj = '99.999.999/9999-99';
                          mascaraRgIe = '999.999.999.999';
                        }
                        fj = true;
                      },
                    );
                  }),
                  GetBuilder<ClientesAlteracaoController>(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(Space.spacing_8),
                        child: TextField(
                          inputFormatters: [
                            TextInputMask(
                              mask: [mascaraCpfCnpj],
                              reverse: false,
                            )
                          ],
                          controller: cnpjCpfController,
                          onChanged: clientesAlteracaoController.setCnpjCpf,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            // labelText: Strings.cnpjCpf,
                            labelText:
                                (pessoa == 'F') ? Strings.cpf : Strings.cnpj,

                            border: const OutlineInputBorder(),
                            errorText: clientesAlteracaoController.cnpjCpfError,
                          ),
                        ),
                      );
                    },
                  ),
                  GetBuilder<ClientesAlteracaoController>(
                    builder: (_) {
                      return Padding(
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
                          onChanged: clientesAlteracaoController.setIeRg,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            // labelText: Strings.ieRg,
                            labelText:
                                (pessoa == 'F') ? Strings.rg : Strings.ie,
                            border: const OutlineInputBorder(),
                            errorText: clientesAlteracaoController.iERGError,
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: contatoController,
                      onChanged: clientesAlteracaoController.setContato,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.contato,
                        border: const OutlineInputBorder(),
                        errorText: clientesAlteracaoController.contatoError,
                      ),
                    ),
                  ),
                  GetBuilder<ClientesAlteracaoController>(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(Space.spacing_8),
                        child: TextField(
                          //!  FORMATAÇÀO DO E-MAIL
                          inputFormatters: [
                            LowerCaseTextFormatter(),
                          ],
                          controller: emailController,
                          onChanged: clientesAlteracaoController.setEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: Strings.email,
                            border: const OutlineInputBorder(),
                            errorText: clientesAlteracaoController.emailError,
                          ),
                        ),
                      );
                    },
                  ),
                  GetBuilder<ClientesAlteracaoController>(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(Space.spacing_8),
                        child: TextField(
                          //! fone
                          inputFormatters: [
                            TextInputMask(
                                mask: ['(99) 9999-9999', '(99) 99999-9999'],
                                reverse: false)
                          ],
                          controller: foneCom1Controller,
                          onChanged: clientesAlteracaoController.setFone1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: Strings.foneCom1,
                            border: const OutlineInputBorder(),
                            errorText: clientesAlteracaoController.fone1Error,
                          ),
                        ),
                      );
                    },
                  ),
                  GetBuilder<ClientesAlteracaoController>(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(Space.spacing_8),
                        child: TextField(
                          inputFormatters: [
                            TextInputMask(
                                mask: ['(99) 9999-9999', '(99) 99999-9999'],
                                reverse: false),
                          ],
                          controller: foneCom2Controller,
                          onChanged: clientesAlteracaoController.setFone2,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: Strings.foneCom2,
                            border: const OutlineInputBorder(),
                            errorText: clientesAlteracaoController.fone2Error,
                          ),
                        ),
                      );
                    },
                  ),
                  GetBuilder<ClientesAlteracaoController>(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(Space.spacing_8),
                        child: TextField(
                          inputFormatters: [
                            TextInputMask(
                                mask: ['(99) 9999-9999', '(99) 99999-9999'],
                                reverse: false),
                          ],
                          controller: foneCelController,
                          onChanged: clientesAlteracaoController.setFoneCel,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: Strings.foneCel,
                            border: const OutlineInputBorder(),
                            errorText: clientesAlteracaoController.fone2Error,
                          ),
                        ),
                      );
                    },
                  ),
                  GetBuilder<ClientesAlteracaoController>(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(Space.spacing_8),
                        child: TextField(
                          inputFormatters: [
                            TextInputMask(
                                mask: ['(99) 9999-9999', '(99) 99999-9999'],
                                reverse: false),
                          ],
                          controller: foneResController,
                          onChanged: clientesAlteracaoController.setFoneRes,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: Strings.foneRes,
                            border: const OutlineInputBorder(),
                            errorText: clientesAlteracaoController.foneResError,
                          ),
                        ),
                      );
                    },
                  ),
                  GetBuilder<ClientesAlteracaoController>(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(Space.spacing_8),
                        child: TextField(
                          inputFormatters: [
                            TextInputMask(
                                mask: ['(99) 9999-9999', '(99) 99999-9999'],
                                reverse: false),
                          ],
                          controller: faxController,
                          onChanged: clientesAlteracaoController.setFax,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: Strings.fax,
                            border: const OutlineInputBorder(),
                            errorText: clientesAlteracaoController.faxError,
                          ),
                        ),
                      );
                    },
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
                        GetBuilder<ClientesAlteracaoController>(
                          builder: (_) {
                            return ClientesUfDropdown(
                              ufRetorno: (uf) {
                                principalUfController.text = uf;
                                clientesAlteracaoController.setpUF(uf);
                              },
                              msgUFError: clientesAlteracaoController.pUFError,
                              ufController: principalUfController,
                            );
                          },
                        ),
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
                      onChanged: clientesAlteracaoController.setpCidade,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.cidade,
                        border: const OutlineInputBorder(),
                        errorText: clientesAlteracaoController.pCidadeError,
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
                      onChanged: clientesAlteracaoController.setpEndereco,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.endereco,
                        border: const OutlineInputBorder(),
                        errorText: clientesAlteracaoController.pEnderecoError,
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
                      onChanged: clientesAlteracaoController.setpComplemento,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.complemento,
                        border: const OutlineInputBorder(),
                        errorText:
                            clientesAlteracaoController.pComplementoError,
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
                      onChanged: clientesAlteracaoController.setpBairro,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.bairro,
                        border: const OutlineInputBorder(),
                        errorText: clientesAlteracaoController.pBairroError,
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
                      onChanged: clientesAlteracaoController.setpCEP,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: Strings.cep,
                          border: const OutlineInputBorder(),
                          errorText: clientesAlteracaoController.pCEPError),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(Space.spacing_8),
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

                    //! botao copiarEnderecoPrincipal
                    child: ClientesButton(
                      onPress: () {
                        clientesAlteracaoController.copiarEnderecoPrincipal();
                        //! PARA NÃO COPIAR O UF PRINCIPAL PARA A ENTREGA P TESTE
                        clientesAlteracaoController
                            .seteUF(principalUfController.text);
                        if (clientesAlteracaoController.cliente.pUF == null) {
                          // pUFError = 'O ESTADO NÃO PODE SER VAZIO!';
                          return;
                        }

                        entregaUfController.text =
                            clientesAlteracaoController.cliente.pUF!;

                        entregaCidadeController.text =
                            clientesAlteracaoController.cliente.pCidade!;
                        entregaEnderecoController.text =
                            clientesAlteracaoController.cliente.pEndereco!;
                        entregaComplementoController.text =
                            clientesAlteracaoController.cliente.pComplemento ??
                                "";
                        entregaBairroController.text =
                            clientesAlteracaoController.cliente.pBairro!;
                        entregaCepController.text =
                            clientesAlteracaoController.cliente.pCEP!;
                      },
                      titulo: Strings.copiarPrincipal,
                      icone: Icons.copy,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: Row(
                      children: [
                        //! Widget para selecionar o Estado(UF ENTREGA)

                        GetBuilder<ClientesAlteracaoController>(
                          builder: (_) {
                            return ClientesUfDropdown(
                              ufRetorno: (ufEntrega) {
                                entregaUfController.text = ufEntrega;
                                clientesAlteracaoController.seteUF(ufEntrega);
                              },
                              msgUFError: clientesAlteracaoController.eUFError,
                              ufController: entregaUfController,
                            );
                          },
                        ),
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
                      onChanged: clientesAlteracaoController.seteCidade,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.cidade,
                        border: const OutlineInputBorder(),
                        errorText: clientesAlteracaoController.eCidadeError,
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
                      onChanged: clientesAlteracaoController.seteEndereco,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.endereco,
                        border: const OutlineInputBorder(),
                        errorText: clientesAlteracaoController.eEnderecoError,
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
                      onChanged: clientesAlteracaoController.seteComplemento,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.complemento,
                        border: const OutlineInputBorder(),
                        errorText: clientesAlteracaoController.eEnderecoError,
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
                      onChanged: clientesAlteracaoController.seteBairro,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.bairro,
                        border: const OutlineInputBorder(),
                        errorText: clientesAlteracaoController.eBairroError,
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
                      onChanged: clientesAlteracaoController.seteCEP,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.cep,
                        border: const OutlineInputBorder(),
                        errorText: clientesAlteracaoController.eCEPError,
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

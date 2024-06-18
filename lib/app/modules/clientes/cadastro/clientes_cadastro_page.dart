import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:galle/app/modules/clientes/cadastro/clientes_cadastro_controller.dart';
import 'package:galle/app/modules/clientes/widgets/clientes_button.dart';
import 'package:galle/app/modules/clientes/widgets/clientes_uf_dropdown.dart';
import 'package:galle/app/modules/clientes/widgets/lower_case_text_formatter.dart';
import 'package:get/get.dart';
import '../../../core/colors_app.dart';
import '../../../core/font.dart';
import '../../../core/sizes.dart';
import '../../../core/space.dart';
import '../../../core/strings.dart';
import '../widgets/pessoafj_button.dart';
import '../widgets/upper_case_text_formatter.dart';

class ClientesCadastroPage extends StatefulWidget {
  ClientesCadastroPage({super.key});

  @override
  State<ClientesCadastroPage> createState() => _ClientesCadastroPageState();
}

class _ClientesCadastroPageState extends State<ClientesCadastroPage> {
  ClientesCadastroController clientesCadastroController =
      Get.put(ClientesCadastroController());

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

//!  VER RegExp

//*  Abaixo um RegExp para validação de e-mail

// return RegExp(
//                 r'^(([^<>()[\]\\.,&";:\s@\"]+(\.[^<>()[\]\\.,&";:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')

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
          const SizedBox(
            height: Space.spacing_12,
          ),
          Container(
            height: Sizes.sizeH_40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClientesButton(
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                    titulo: Strings.cancelar,
                    icone: Icons.cancel_presentation_outlined),
                ClientesButton(
                  onPress: () {
                    //! BOTAO SALVAR
                    //! tem os campos clienteIdMob, ClienteIdInt, Ativo
                    //! pensar nisso
                    clientesCadastroController.cliente.dispositivoId = 3;
                    clientesCadastroController.cliente.clienteIdMob = 0;
                    clientesCadastroController.cliente.clienteIdInt = "";

                    // 'clienteId': clienteId,
                    // 'dispositivoId': dispositivoId,
                    // 'clienteIdMob': clienteIdMob,
                    // 'clienteIdInt': clienteIdInt,

                    clientesCadastroController.cliente.contato =
                        contatoController.text;
                    clientesCadastroController.cliente.nomeFantasia =
                        nomeFantasiaController.text;

                    clientesCadastroController.cliente.razaoSocial =
                        razaoSocialController.text;
                    clientesCadastroController.cliente.tipoPessoa =
                        pessoaFJController.text;
                    clientesCadastroController.cliente.cNPJCPF =
                        cnpjCpfController.text;
                    clientesCadastroController.cliente.iERG =
                        ieRgController.text;
                    clientesCadastroController.cliente.contato =
                        contatoController.text;
                    clientesCadastroController.cliente.email =
                        emailController.text;
                    clientesCadastroController.cliente.fone1 =
                        foneCom1Controller.text;
                    clientesCadastroController.cliente.fone2 =
                        foneCom2Controller.text;
                    clientesCadastroController.cliente.foneRes =
                        foneResController.text;
                    clientesCadastroController.cliente.fax = faxController.text;

                    clientesCadastroController.cliente.pUF =
                        principalUfController.text;
                    clientesCadastroController.cliente.pCidade =
                        principalCidadeController.text;
                    clientesCadastroController.cliente.pEndereco =
                        principalEnderecoController.text;
                    clientesCadastroController.cliente.pComplemento =
                        principalComplementoController.text;
                    clientesCadastroController.cliente.pBairro =
                        principalBairroController.text;
                    clientesCadastroController.cliente.pCEP =
                        principalCepController.text;

                    clientesCadastroController.cliente.eUF =
                        entregaUfController.text;

                    clientesCadastroController.cliente.eCidade =
                        entregaCidadeController.text;
                    clientesCadastroController.cliente.eEndereco =
                        entregaEnderecoController.text;
                    clientesCadastroController.cliente.eComplemento =
                        entregaComplementoController.text;
                    clientesCadastroController.cliente.eBairro =
                        entregaBairroController.text;
                    clientesCadastroController.cliente.eCEP =
                        entregaCepController.text;
//!  Comentei para não salvar por enquanto para testes
                    clientesCadastroController.save();

                    print(
                        'Pessoa Fisica ou Juridica..(F/J):  ${clientesCadastroController.cliente.tipoPessoa}');

                    print(
                        "ESTADO UF Principal..: ${principalUfController.text}");
                    print("ESTADO UF Entrega..: ${entregaUfController.text}");
                    print(entregaUfController.text == '');
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
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: nomeFantasiaController,
                      onChanged: clientesCadastroController.setNomeFantasia,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.nomeFantasia,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.nomeFantasiaError,
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
                      onChanged: clientesCadastroController.setRazaoSocial,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.razaoSocial,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.razaoSocialError,
                      ),
                    ),
                  ),
                  const Text(
                    Strings.pessoaFJ,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Font.title_18),
                  ),

                  //!  Determina se a pessoa é Física ou Jurídica
                  PessoafjButton(
                    pessoa: (pessoaFouJ) {
                      pessoaFJController.text = pessoaFouJ;
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        TextInputMask(mask: [
                          'AAA AAA',
                          '999.999.999-99',
                          '99.999.999/9999-99'
                        ], reverse: false)
                      ],
                      controller: cnpjCpfController,
                      onChanged: clientesCadastroController.setCnpjCpf,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.cnpjCpf,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.cnpjCpfError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      inputFormatters: [
                        TextInputMask(
                          //! VER COMO ACEITAR A LETRA DO RG MAIUSCULA
                          mask: ['99.999.999-N', '999.999.999.999'],
                          reverse: false,
                        ),
                      ],
                      controller: ieRgController,
                      onChanged: clientesCadastroController.setIeRg,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.ieRg,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.iERGError,
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
                      onChanged: clientesCadastroController.setContato,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.contato,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.contatoError,
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
                      onChanged: clientesCadastroController.setEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: Strings.email,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.emailError,
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
                      onChanged: clientesCadastroController.setFone1,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneCom1,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.fone1Error,
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
                      onChanged: clientesCadastroController.setFone2,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneCom2,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.fone2Error,
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
                      onChanged: clientesCadastroController.setFoneCel,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneCel,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.fone2Error,
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
                      onChanged: clientesCadastroController.setFoneRes,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneRes,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.foneResError,
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
                      onChanged: clientesCadastroController.setFax,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.fax,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.faxError,
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
                        GetBuilder<ClientesCadastroController>(
                          builder: (_) {
                            return ClientesUfDropdown(
                              ufRetorno: (uf) {
                                principalUfController.text = uf;
                                clientesCadastroController.setpUF(uf);
                              },
                              msgUFError: clientesCadastroController.pUFError,
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
                      onChanged: clientesCadastroController.setpCidade,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.cidade,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.pCidadeError,
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
                      onChanged: clientesCadastroController.setpEndereco,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.endereco,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.pEnderecoError,
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
                      onChanged: clientesCadastroController.setpComplemento,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.complemento,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.pComplementoError,
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
                      onChanged: clientesCadastroController.setpBairro,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.bairro,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.pBairroError,
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
                      onChanged: clientesCadastroController.setpCEP,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: Strings.cep,
                          border: const OutlineInputBorder(),
                          errorText: clientesCadastroController.pCEPError),
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
                        clientesCadastroController.copiarEnderecoPrincipal();
                        //! PARA NÃO COPIAR O UF PRINCIPAL PARA A ENTREGA P TESTE
                        clientesCadastroController
                            .seteUF(principalUfController.text);
                        if (clientesCadastroController.cliente.pUF == null) {
                          // pUFError = 'O ESTADO NÃO PODE SER VAZIO!';
                          return;
                        }

                        entregaUfController.text =
                            clientesCadastroController.cliente.pUF!;

                        entregaCidadeController.text =
                            clientesCadastroController.cliente.pCidade!;
                        entregaEnderecoController.text =
                            clientesCadastroController.cliente.pEndereco!;
                        entregaComplementoController.text =
                            clientesCadastroController.cliente.pComplemento ??
                                "";
                        entregaBairroController.text =
                            clientesCadastroController.cliente.pBairro!;
                        entregaCepController.text =
                            clientesCadastroController.cliente.pCEP!;
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

                        GetBuilder<ClientesCadastroController>(
                          builder: (_) {
                            return ClientesUfDropdown(
                              ufRetorno: (ufEntrega) {
                                entregaUfController.text = ufEntrega;
                                clientesCadastroController.seteUF(ufEntrega);
                              },
                              msgUFError: clientesCadastroController.eUFError,
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
                      onChanged: clientesCadastroController.seteCidade,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.cidade,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.eCidadeError,
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
                      onChanged: clientesCadastroController.seteEndereco,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.endereco,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.eEnderecoError,
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
                      onChanged: clientesCadastroController.seteComplemento,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.complemento,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.eEnderecoError,
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
                      onChanged: clientesCadastroController.seteBairro,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.bairro,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.eBairroError,
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
                      onChanged: clientesCadastroController.seteCEP,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.cep,
                        border: const OutlineInputBorder(),
                        errorText: clientesCadastroController.eCEPError,
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

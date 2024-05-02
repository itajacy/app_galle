import 'package:flutter/material.dart';
import 'package:galle/app/modules/clientes/cadastro/clientes_cadastro_controller.dart';
import 'package:galle/app/modules/clientes/widgets/clientes_button.dart';
import 'package:galle/app/modules/clientes/widgets/clientes_uf_dropdown.dart';
import 'package:get/get.dart';
import '../../../core/colors_app.dart';
import '../../../core/font.dart';
import '../../../core/sizes.dart';
import '../../../core/space.dart';
import '../../../core/strings.dart';
import '../widgets/pessoafj_button.dart';

class ClientesCadastroPage extends StatefulWidget {
  ClientesCadastroPage({super.key});

  @override
  State<ClientesCadastroPage> createState() => _ClientesCadastroPageState();
}

class _ClientesCadastroPageState extends State<ClientesCadastroPage> {
  ClientesCadastroController clientesCadastroController =
      Get.put(ClientesCadastroController());

  PessoafjButton pessoaFJB = Get.put(PessoafjButton(
    builder: (controller) => x,
  ));

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
                  onPress: () {
                    //! tem os campos clienteIdMob, ClienteIdInt, Ativo
                    //! pensar nisso

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

                    //! O print abaixo demonstra que o botao
                    //! "Copiar Principal"  está funcionando

                    print("Cidade da entrega inicio");
                    print(clientesCadastroController.cliente.eCidade);
                    print("Cidade da entrega fim");

                    //!! salvar

                    // clientesCadastroController.save();
                  },
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
                      onChanged: clientesCadastroController.setNomeFantasia,
                      controller: nomeFantasiaController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.nomeFantasia,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.nomeFantasiaError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: razaoSocialController,
                      onChanged: clientesCadastroController.setRazaoSocial,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.razaoSocial,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.razaoSocialError,
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
                      onChanged: clientesCadastroController.setCnpjCpf,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.cnpjCpf,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.cnpjCpfError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: ieRgController,
                      onChanged: clientesCadastroController.setIeRg,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.ieRg,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.iERGError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: contatoController,
                      onChanged: clientesCadastroController.setContato,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.contato,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.contatoError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: emailController,
                      onChanged: clientesCadastroController.setEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: Strings.email,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.emailError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: foneCom1Controller,
                      onChanged: clientesCadastroController.setFone1,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneCom1,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.fone1Error,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: foneCom2Controller,
                      onChanged: clientesCadastroController.setFone2,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneCom2,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.fone2Error,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: foneResController,
                      onChanged: clientesCadastroController.setFoneRes,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: Strings.foneRes,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.foneResError,
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
                      onChanged: clientesCadastroController.setpCidade,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.cidade,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.pCidadeError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: principalEnderecoController,
                      onChanged: clientesCadastroController.setpEndereco,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.endereco,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.pEnderecoError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: principalComplementoController,
                      onChanged: clientesCadastroController.setpComplemento,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.complemento,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.pComplementoError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: principalBairroController,
                      onChanged: clientesCadastroController.setpBairro,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.bairro,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.pBairroError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: principalCepController,
                      onChanged: clientesCadastroController.setpCEP,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: Strings.cep,
                          border: OutlineInputBorder(),
                          errorText: clientesCadastroController.pCEPError),
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
                      onPress: () {

                        //! está funcionando sem chamar o método
                        //! e NÃO entendo o pq que está funcionando
                        // clientesCadastroController.copiarEnderecoPrincipal();

                        entregaCidadeController.text =
                            clientesCadastroController.cliente.pCidade!;
                        entregaEnderecoController.text =
                            clientesCadastroController.cliente.pEndereco!;
                        entregaComplementoController.text =
                            clientesCadastroController.cliente.pComplemento!;
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
                      onChanged: clientesCadastroController.seteCidade,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.cidade,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.eCidadeError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: entregaEnderecoController,
                      onChanged: clientesCadastroController.seteEndereco,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: Strings.endereco,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.eEnderecoError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: entregaComplementoController,
                      onChanged: clientesCadastroController.seteComplemento,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.complemento,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.eEnderecoError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: entregaBairroController,
                      onChanged: clientesCadastroController.seteBairro,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: Strings.bairro,
                        border: OutlineInputBorder(),
                        errorText: clientesCadastroController.eBairroError,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.spacing_8),
                    child: TextField(
                      controller: entregaCepController,
                      onChanged: clientesCadastroController.seteBairro,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: Strings.cep,
                        border: OutlineInputBorder(),
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

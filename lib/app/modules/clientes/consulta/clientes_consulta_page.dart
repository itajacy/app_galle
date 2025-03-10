//* alterado em 24/09/24
import 'package:flutter/material.dart';
import 'package:galle/app/core/colors_app.dart';
import 'package:galle/app/core/navigation/routes.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/core/space.dart';
import 'package:galle/app/models/cliente.dart';
import 'package:galle/app/modules/clientes/consulta/clientes_consulta_controller.dart';
import 'package:galle/app/modules/clientes/widgets/upper_case_text_formatter.dart';
import 'package:galle/app/widgets/general_icon_button.dart';
import 'package:get/get.dart';

import '../../../core/font.dart';
import '../../../core/strings.dart';
import '../widgets/clientes_button.dart';

class ClientesConsultaPage extends StatefulWidget {
  ClientesConsultaPage({super.key});

  @override
  State<ClientesConsultaPage> createState() => _ClientesConsultaPageState();
}

class _ClientesConsultaPageState extends State<ClientesConsultaPage> {
  // final ClientesConsultaController clientesConsultaController =
  //     ClientesConsultaController();

//! Get.put do cadastro
  ClientesConsultaController clientesConsultaController =
      Get.put(ClientesConsultaController());

  ClientesConsultaController listaDeClientesController =
      Get.put(ClientesConsultaController());

  final clienteController = TextEditingController();
  // Future<List<Cliente>>? _listaDeClientes;

  @override
  void initState() {
    listaDeClientesController.buscarTodos();

    super.initState();
  }

//todo dispose religado para teste
  // @override
  // void dispose() {
  //   clientesConsultaController.dispose();
  //   listaDeClientesController.dispose();
  //   super.dispose();
  // }

  void _limpaControllers() {
    clientesConsultaController.onClose();
    listaDeClientesController.onClose();
  }

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
          const SizedBox(
            height: Space.spacing_8,
          ),
          Padding(
            padding: const EdgeInsets.all(Space.spacing_8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 90,
                  child: TextField(
                    onChanged: (value) {
                      clientesConsultaController.buscarCliente(value);
                    },
                    // focusNode: primaryFocus,
                    inputFormatters: [UpperCaseTextFormatter()],
                    controller: clienteController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: Strings.cliente,
                      labelStyle: TextStyle(fontSize: Font.title_24),
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
                GeneralIconButton(
                  onPress: () {
                    Navigator.of(context)
                        .pushNamed(Routes.clientesCadastroPage);
                  },
                  icone: Icons.person_add_alt_1,
                  iconSize: Sizes.sizeH_35,
                  buttonWidth: Sizes.sizeW_64,
                  buttonHeight: Sizes.sizeH_55,
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<ClientesConsultaController>(
              builder: (_) {
                return ListView.builder(
                  itemCount: listaDeClientesController.listaDeClientes.length,
                  itemBuilder: (context, index) {
                    Cliente cliente =
                        listaDeClientesController.listaDeClientes[index];
                    return ListTile(
                      shape: Border.all(width: 1, style: BorderStyle.none),
                      contentPadding: const EdgeInsets.only(
                          left: Space.spacing_8, right: Space.spacing_8),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    (cliente.clienteIdInt!.isNotEmpty)
                                        ? cliente.clienteIdInt!
                                        : "              ",
                                    style: const TextStyle(
                                        fontSize: Font.title_16),
                                  ),
                                  const SizedBox(
                                    width: Space.spacing_8,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width > 450
                                            ? Sizes.sizeW_400
                                            : Sizes.sizeW_150,
                                    child: Text(
                                      cliente.nomeFantasia!,
                                      style: const TextStyle(
                                        fontSize: Font.title_16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width > 450
                                            ? Sizes.sizeW_400
                                            : Sizes.sizeW_230,
                                    child: Text(
                                      cliente.razaoSocial!,
                                      style: const TextStyle(
                                        fontSize: Font.title_16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GeneralIconButton(
                                onPress: () async {
                                  if (cliente.clienteIdInt!.isNotEmpty) {
                                    //Consulta de cliente
                                    Navigator.of(context).pushNamed(
                                        '/clientesConsultaDetalhesPage',
                                        arguments: cliente);
                                  } else {
                                    //Alteração de cliente
                                    print(
                                        'CONSULTA PAGE - CLIENTE ID--> ${cliente.clienteId}');
                                    var clienteAlterado =
                                        await Navigator.of(context).pushNamed(
                                            '/clientesAlteracaoDetalhesPage',
                                            arguments: cliente);
                                    if (clienteAlterado == true) {
                                      listaDeClientesController.buscarTodos();
                                    }
                                  }
                                },
                                icone: (cliente.clienteIdInt!.isNotEmpty)
                                    ? Icons.folder_shared_outlined
                                    : Icons.edit_outlined,
                                iconSize: Sizes.sizeH_30,
                                buttonWidth: Sizes.sizeW_50,
                                buttonHeight: Sizes.sizeW_50,
                                iconeForegroundColor:
                                    ColorsApp.iconeForegroundLSecond,
                              ),
                              const SizedBox(width: Space.spacing_8),
                              GeneralIconButton(
                                onPress: () {
                                  if (cliente.clienteIdInt!.isEmpty) {
                                    return showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (_) {
                                        return AlertDialog(
                                          title: Row(
                                            children: [
                                              Text(
                                                cliente.nomeFantasia
                                                    .toString()
                                                    .substring(
                                                        0,
                                                        cliente.nomeFantasia
                                                                    .toString()
                                                                    .length <
                                                                30
                                                            ? cliente
                                                                .nomeFantasia
                                                                .toString()
                                                                .length
                                                            : 30),
                                                style: const TextStyle(
                                                    fontSize: Font.title_14,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ],
                                          ),
                                          content: const Row(
                                            children: [
                                              Icon(
                                                Icons.warning_amber,
                                                size: Sizes.sizeH_50,
                                                color: ColorsApp.iconeAlerta,
                                              ),
                                              SizedBox(
                                                width: Space.spacing_5,
                                              ),
                                              Text(
                                                'Confirma exclusão?',
                                                style: TextStyle(
                                                    fontSize: Font.title_16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          elevation: Sizes.sizeH_25,
                                          // shadowColor:
                                          //     Color.fromARGB(255, 173, 15, 4),
                                          actions: [
                                            //botoes sim e nao
                                            ClientesButton(
                                              onPress: () {
                                                clientesConsultaController
                                                    .deleteCliente(
                                                        cliente.clienteId!);
                                                _limpaControllers();
                                                Get.showSnackbar(
                                                  const GetSnackBar(
                                                    backgroundColor: ColorsApp
                                                        .appBarBackground,
                                                    titleText: Text(
                                                      'Cliente excluído com SUCESSO!',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: ColorsApp
                                                            .textoForegYellow,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: Font.title_20,
                                                      ),
                                                    ),
                                                    message: 'Boas vendas',
                                                    duration:
                                                        Duration(seconds: 3),
                                                  ),
                                                );
                                                Navigator.of(context).pop();
                                              },
                                              titulo: "SIM",
                                              icone: Icons.delete_forever,
                                              minimoSize: const Size(
                                                  Sizes.sizeW_90,
                                                  Sizes.sizeH_40),
                                            ),
                                            ClientesButton(
                                              onPress: () {
                                                Navigator.of(context).pop();
                                              },
                                              titulo: "NÃO",
                                              icone:
                                                  Icons.not_interested_outlined,
                                              minimoSize: const Size(
                                                  Sizes.sizeW_90,
                                                  Sizes.sizeH_40),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                icone: Icons.delete_forever_rounded,
                                iconSize: Sizes.sizeH_30,
                                buttonWidth: Sizes.sizeW_50,
                                buttonHeight: Sizes.sizeW_50,
                                ativo: (cliente.clienteIdInt!.isEmpty)
                                    ? true
                                    : false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

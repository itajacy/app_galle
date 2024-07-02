import 'package:flutter/material.dart';
import 'package:galle/app/core/colors_app.dart';
import 'package:galle/app/core/navigation/routes.dart';
import 'package:galle/app/core/sizes.dart';
import 'package:galle/app/core/space.dart';
import 'package:galle/app/models/cliente.dart';
import 'package:galle/app/modules/clientes/consulta/clientes_consulta_controller.dart';
import 'package:galle/app/modules/clientes/widgets/upper_case_text_formatter.dart';
import 'package:galle/app/widgets/general_icon_button.dart';

import '../../../core/font.dart';
import '../../../core/strings.dart';

class ClientesConsultaPage extends StatefulWidget {
  ClientesConsultaPage({super.key});

  @override
  State<ClientesConsultaPage> createState() => _ClientesConsultaPageState();
}

class _ClientesConsultaPageState extends State<ClientesConsultaPage> {
  final ClientesConsultaController clientesConsultaController =
      ClientesConsultaController();

  final clienteController = TextEditingController();

  ClientesConsultaController listaDeClientesController =
      ClientesConsultaController();

  Future<List<Cliente>>? _listaDeClientes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listaDeClientes = listaDeClientesController.buscarTodos();
    _listaDeClientes?.then((value) {
      setState(() {
        _listaDeClientes = Future.value(value);
      });
    });
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
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextField(
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
          FutureBuilder<List<Cliente>>(
            // initialData: const [],
            future: _listaDeClientes,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  print("CASO ##### 1");
                  break;
                case ConnectionState.waiting:
                  print("CASO ESPERANDO/CARREGANDO ##### 2");
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando..."),
                      ],
                    ),
                  );
                case ConnectionState.active:
                  print("CASO ##### 3");
                  return const Center(
                    child: Text("Carregamento ativo..."),
                  );
                case ConnectionState.done:
                  print("CASO FEITO ##### 4");
                  print("snapshot.data ... ${snapshot.data}");
                  if (snapshot.data == null) {
                    print("LISTA DE CLIENTES VAZIA");
                    return const Center(
                      child: Text(
                        "Não há clientes cadastrados.",
                        style: TextStyle(
                          fontSize: Font.title_20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: ColorsApp.appBarBackground,
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    print("CASO ##### 5 - ESTÁ  PARANDO AQUIAQUI");
                    return Center(
                      child: Text("Erro: ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    print("CASO ##### 6");
                    return const Center(
                      child: Text("Nenhum cliente encontrado."),
                    );
                  } else {
                    print("CASO ##### 7");
                    final listaClientes = snapshot.data ?? <Cliente>[];
                    print(
                        "ENTRANDO NO LISTVIEW BUILDER ########################");
                    print(
                        "Qtde de clientes no ListView Builder--> ${listaClientes.length}");
                    if (listaClientes.isEmpty) {
                      return const Center(
                        child: Text("Não há Clientes cadastrados"),
                      );
                    }
                    print(
                        "Tamanho de listaClientes.length.. ${listaClientes.length}");
                    return Expanded(
                      child: ListView.builder(
                        itemCount: listaClientes.length,
                        itemBuilder: (context, index) {
                          // print(index);
                          Cliente cliente = listaClientes[index];

                          return ListTile(
                            shape:
                                Border.all(width: 1, style: BorderStyle.none),
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
                                          style: TextStyle(
                                              fontSize: Font.title_16),
                                        ),
                                        SizedBox(
                                          width: Space.spacing_8,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  450
                                              ? Sizes.sizeW_400
                                              : Sizes.sizeW_150,
                                          child: Text(
                                            cliente.nomeFantasia!,
                                            style: TextStyle(
                                              fontSize: Font.title_16,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  450
                                              ? Sizes.sizeW_400
                                              : Sizes.sizeW_230,
                                          child: Text(
                                            cliente.razaoSocial!,
                                            style: TextStyle(
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
                                    // const SizedBox(width: Space.spacing_5),
                                    GeneralIconButton(
                                      onPress: () {},
                                      icone: Icons.folder_shared_outlined,
                                      iconSize: Sizes.sizeH_30,
                                      buttonWidth: Sizes.sizeW_50,
                                      buttonHeight: Sizes.sizeW_50,
                                      iconeForegroundColor:
                                          //  Colors.white70,
                                          ColorsApp.iconeForegroundLSecond,
                                    ),
                                    const SizedBox(width: Space.spacing_8),
                                    GeneralIconButton(
                                      onPress: () {},
                                      icone: Icons.delete_forever_rounded,
                                      iconSize: Sizes.sizeH_30,
                                      buttonWidth: Sizes.sizeW_50,
                                      buttonHeight: Sizes.sizeW_50,
                                      iconeForegroundColor:
                                          ColorsApp.iconeForegroundThird,
                                      // Colors.grey[350],
                                      // Colors.white70,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

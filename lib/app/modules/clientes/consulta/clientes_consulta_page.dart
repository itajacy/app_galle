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

  // List<Cliente> listaDeClientes = [];
  final clienteController = TextEditingController();

  ClientesConsultaController listaDeClientesController =
      ClientesConsultaController();

// O PROBLEMA DELE NÃO CONSEGUIR EXECUTAR A CONSULTA PROVAVELMENTE SE DEVE PELO FATO DELE NÃO
// CONSEGUIR SALVAR TODOS OS DADOS DO CLIENTE POIS PELO VISTO ALGUNS CAMPOS FALTARAM
// 'clienteId': clienteId,
// 'dispositivoId': dispositivoId,
// 'clienteIdMob': clienteIdMob,git
// 'clienteIdInt': clienteIdInt,

  // final List<String> codigoClientes = [
  //   '1234-00',
  //   '3453-03',
  //   '4784-02',
  //   '1235-00',
  //   '8906-00',
  //   '5798-01',
  //   '2345-00',
  //   '6543-02',
  //   '8946-00',
  //   '1256-00',
  //   '3456-01',
  //   '6783-00',
  //   '9045-03',
  //   '1245-02',
  //   '6783-01',
  // ];

  // final List<String> fantasiaClientes = [
  //   'UNIKA  ',
  //   'BRUTOS FOLHEADOS',
  //   'MELODIA BIJOUX',
  //   'GALLE FOLHEADOS',
  //   'VIPFOLHEADOS',
  //   'GULLO SEMI-JOIAS',
  //   'GAZIN FOLHEADOS',
  //   'DUTRA FOLHEADOS',
  //   'CARMINHA BRUTOS',
  //   'REOUX LOUZ DAS',
  //   'ATRIZ LUZ LINDA',
  //   'TEGUCIGALPA JUI',
  //   'CANNABIS SATIVA',
  //   'CURURU DAS TREVAS',
  //   'RAMINHA JOIAS',
  // ];

  // final List<String> razaoClientes = [
  //   'UNIKA ',
  //   'BRUTOS FOLHEADOS E COMPANHIA LIMITADA',
  //   'MELODIA BIJOUX E FILHOS LTDA',
  //   'GALLE INDUSTRIA E COMERCIO DE BIJOUTERIAS LTDA',
  //   'VIPFOLHEADOS COMERCIO DE BIJOUTERIAS ME',
  //   'GULLO SEMI-JOIAS LTDA',
  //   'GAZIN FOLHEADOS E DIVERSOS',
  //   'DUTRA INDUSTRIA E COMERCIO DE BIJOUTERIAS E PRODUTOS ESTETICOS',
  //   'CARMINHA BRUTOS E ACESSORIOS',
  //   'REOUX LOUZ ACESSORIOS E BRUTOS',
  //   'ATRIZ LUZ LINDA OBJETOS DE VALOR',
  //   'TEGUCIGALPA E FILHOS LTDA',
  //   'CANNABIS DEIXA TUDO MUITO DOIDO',
  //   'CURURU IND E COM DE BIJOUTERIAS  ',
  //   'RAMIS E FILHAS SEMIJOIAS',
  // ];

  @override
  Widget build(BuildContext context) {
    // List<Cliente> listaDeClientes = clientesConsultaController.buscarTodos();
    // List<Map<String, dynamic>> clientesMap = [];
    // for (var element in listaDeClientes) {
    //   Map<String, dynamic> cliente = {};
    //   cliente = element.toMap();
    //   clientesMap.add(cliente);
    // }

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
            initialData: const [],
            future: listaDeClientesController.buscarTodos(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
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
                  return const Center(
                    child: Text("Carregamento ativo..."),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Erro: ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text("Nenhum cliente encontrado."),
                    );
                  } else {
                    final List<Cliente> listaClientes =
                        snapshot.data as List<Cliente>;
                    print(listaClientes.length);

                    return ListView.builder(
                      itemCount: listaClientes.length,
                      itemBuilder: (context, index) {
                        final Cliente cliente = listaClientes[index];
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
                                        cliente.clienteIdInt.toString() ?? "",
                                        style:
                                            TextStyle(fontSize: Font.title_16),
                                      ),
                                      SizedBox(
                                        width: Space.spacing_8,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width >
                                                    450
                                                ? Sizes.sizeW_400
                                                : Sizes.sizeW_150,
                                        child: Text(
                                          cliente.nomeFantasia.toString() ?? "",
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
                                        width:
                                            MediaQuery.of(context).size.width >
                                                    450
                                                ? Sizes.sizeW_400
                                                : Sizes.sizeW_230,
                                        child: Text(
                                          cliente.razaoSocial.toString() ?? "",
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
                    );
                  }
              }
              return const SizedBox.shrink();
            },
          ),
          // Expanded(
          //   flex: 1,
          //   child: ListView.builder(
          //     itemCount: codigoClientes.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         shape: Border.all(width: 1, style: BorderStyle.none),
          //         contentPadding: const EdgeInsets.only(
          //             left: Space.spacing_8, right: Space.spacing_8),
          //         title: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   children: [
          //                     Text(
          //                       codigoClientes[index],
          //                       style: TextStyle(fontSize: Font.title_16),
          //                     ),
          //                     SizedBox(
          //                       width: Space.spacing_8,
          //                     ),
          //                     Container(
          //                       width: MediaQuery.of(context).size.width > 450
          //                           ? Sizes.sizeW_400
          //                           : Sizes.sizeW_150,
          //                       child: Text(
          //                         fantasiaClientes[index],
          //                         style: TextStyle(
          //                           fontSize: Font.title_16,
          //                           overflow: TextOverflow.ellipsis,
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: [
          //                     Container(
          //                       width: MediaQuery.of(context).size.width > 450
          //                           ? Sizes.sizeW_400
          //                           : Sizes.sizeW_230,
          //                       child: Text(
          //                         razaoClientes[index],
          //                         style: TextStyle(
          //                           fontSize: Font.title_16,
          //                           overflow: TextOverflow.ellipsis,
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               children: [
          //                 // const SizedBox(width: Space.spacing_5),
          //                 GeneralIconButton(
          //                   onPress: () {},
          //                   icone: Icons.folder_shared_outlined,
          //                   iconSize: Sizes.sizeH_30,
          //                   buttonWidth: Sizes.sizeW_50,
          //                   buttonHeight: Sizes.sizeW_50,
          //                   iconeForegroundColor:
          //                       //  Colors.white70,
          //                       ColorsApp.iconeForegroundLSecond,
          //                 ),
          //                 const SizedBox(width: Space.spacing_8),
          //                 GeneralIconButton(
          //                   onPress: () {},
          //                   icone: Icons.delete_forever_rounded,
          //                   iconSize: Sizes.sizeH_30,
          //                   buttonWidth: Sizes.sizeW_50,
          //                   buttonHeight: Sizes.sizeW_50,
          //                   iconeForegroundColor:
          //                       ColorsApp.iconeForegroundThird,
          //                   // Colors.grey[350],
          //                   // Colors.white70,
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

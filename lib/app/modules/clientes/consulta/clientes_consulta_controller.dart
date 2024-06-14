import 'package:galle/app/services/database/dao/clientes_dao.dart';
import 'package:get/get.dart';

import '../../../models/cliente.dart';

class ClientesConsultaController extends GetxController {
  ClientesDao clientesDao = ClientesDao();
  List<Cliente> listaDeClientes = [];

  buscarTodos() async {
    listaDeClientes = await clientesDao.findAll();
  }
}

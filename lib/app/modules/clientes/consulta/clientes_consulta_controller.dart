import 'package:galle/app/services/database/dao/clientes_dao.dart';
import 'package:get/get.dart';

import '../../../models/cliente.dart';

class ClientesConsultaController extends GetxController {
  ClientesDao clientesDao = ClientesDao();
  List<Cliente> listaDeClientes = [];

  Future<List<Cliente>> buscarTodos() async {
    listaDeClientes = await clientesDao.findAll();
    update();
    return listaDeClientes;
  }

//! =============
  Future<List<Cliente>> buscarCliente(String cliente) async {
    listaDeClientes = await clientesDao.findClientes(cliente);
    update();
    return listaDeClientes;
  }

  Future<List<Cliente>> deleteCliente(int id) async {
    final result = await clientesDao.excluir(id);
    // print('valor resultado ao excluir um cliente= $result');
    listaDeClientes = await clientesDao.findAll();
    update();
    return listaDeClientes;
  }
}

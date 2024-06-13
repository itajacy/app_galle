import 'package:galle/app/services/database/dao/clientes_dao.dart';

import '../../../models/cliente.dart';

class ClientesConsultaController {
  ClientesDao clientesDao = ClientesDao();
  List<Cliente> clientes = [];

  buscarTodos() async {
    clientes = await clientesDao.findAll();
  }
}

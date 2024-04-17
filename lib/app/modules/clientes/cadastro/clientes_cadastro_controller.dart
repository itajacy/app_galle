import 'package:galle/app/services/database/dao/clientes_dao.dart';

import '../../../models/cliente.dart';

class ClientesCadastroController {

  ClientesDao clientesDao = ClientesDao();
  Cliente cliente = Cliente();

  salvar() async {
    int resposta = await clientesDao.salvar(cliente);
    
  }
}

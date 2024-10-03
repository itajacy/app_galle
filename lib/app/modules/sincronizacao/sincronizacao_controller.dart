import '../../models/cliente.dart';
import '../../services/database/dao/clientes_dao.dart';

class SincronizacaoController {
  ClientesDao clientesDao = ClientesDao();

  Future<int> lerArquivoESalvarClientes(Cliente cliente) async {
    int resposta = await clientesDao.salvar(cliente);
    return resposta;
  }

  Future<int> apagaTodosOsClientes() async {
    int resultado = await clientesDao.deleteAll();
    return resultado;
  }
}

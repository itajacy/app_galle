import '../../models/cliente.dart';
import '../../services/database/dao/clientes_dao.dart';

class SincronizacaoController {
  ClientesDao clientesDao = ClientesDao();
  int resposta = 0;
  Future<int> lerArquivoESalvarClientes(Cliente cliente) async {
    List resp = await clientesDao.findClientes(cliente.razaoSocial!);

    if (resp.isNotEmpty) {
      resposta = await clientesDao.alterar(cliente);
    } else {
      resposta = await clientesDao.salvar(cliente);
    }
    return resposta;
  }

  Future<int> apagaTodosOsClientes() async {
    int resultado = await clientesDao.deleteAll();
    return resultado;
  }
}

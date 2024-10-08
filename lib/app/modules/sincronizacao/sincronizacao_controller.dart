import '../../models/cliente.dart';
import '../../services/database/dao/clientes_dao.dart';

class SincronizacaoController {
  ClientesDao clientesDao = ClientesDao();
  int resposta = 0;
  Future<int> lerArquivoESalvarClientes(Cliente cliente) async {
    List resp = await clientesDao.findClientes(cliente.razaoSocial!);
    print('resp--> ${resp.length}');
    if (resp.length != 0) {
      //se a lista  NAO for vazia, ALTERA o cliente, pq ele não  JA existe na tabela
      resposta = await clientesDao.alterar(cliente);
      print('resposta--> $resposta');
      print('ClienteId  alterado--> ${cliente.clienteId}');
    } else {
      //se a lista for vazia salva o cliente, pq ele não existe na tabela
      resposta = await clientesDao.salvar(cliente);
      print('resposta--> $resposta');
      print('ClienteId  novo--> ${cliente.clienteId}');
    }
    print(
        '----------------==================----------------===============---------------');
    return resposta;
  }

  Future<int> apagaTodosOsClientes() async {
    int resultado = await clientesDao.deleteAll();
    return resultado;
  }
}

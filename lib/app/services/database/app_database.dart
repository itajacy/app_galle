import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dao/clientes_dao.dart';
import 'dao/dispositivo_dao.dart';
import 'dao/pedidos_dao.dart';
import 'dao/tabela_dao.dart';

Future<Database> getDatabase() async {
  final String path = await getDatabasesPath();

  return openDatabase(
    join(path, 'appGalle.db'),
    onCreate: (db, version) {
      //!  aqui estarão todas as tabelas que forem criadas
      db.execute(ClientesDao.tabelaClientes);
      db.execute(PedidosDao.tabelaPedidos);
      db.execute(DispositivoDao.tabelaDispositivo);
      db.execute(TabelaDao.tabelaTabela);
    },
    version: 1,
  );
}

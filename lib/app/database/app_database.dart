import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dao/clientes_dao.dart';

Future<Database> getDatabase() async {
  final String path = await getDatabasesPath();

  return openDatabase(
    join(path, 'appGalle.db'),
    onCreate: (db, version) {
      //!  aqui estarão todas as tabelas que forem criadas
      db.execute(ClientesDao.tabelaClientes);
    },
    version: 1,
  );
}

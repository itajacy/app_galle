/* 
Data: 20/08/2024
*/
import '../../../models/dispositivo.dart';
import 'package:galle/app/services/database/app_database.dart';
import 'package:sqflite/sqflite.dart';

class DispositivoDao {
  static const String tabelaDispositivo = 'CREATE TABLE $_tableName('
      '$_id INTEGER, '
      '$_dispositivoId TEXT, '
      '$_address TEXT, '
      '$_urlImagens TEXT, '
      '$_representanteIdInt TEXT, '
      '$_usuarioFtp TEXT, '
      '$_senhaFtp TEXT, '
      '$_seqCliente TEXT, '
      '$_precoEsp TEXT, '
      '$_mercado TEXT, '
      '$_email TEXT)';

  static const String _tableName = 'dispositivo';
  static const String _id = 'id';
  static const String _dispositivoId = 'DispositivoID';
  static const String _address = 'address';
  static const String _urlImagens = 'urlImagens';
  static const String _representanteIdInt = 'RepresentanteID_Int';
  static const String _usuarioFtp = 'usuarioFtp';
  static const String _senhaFtp = 'senhaFtp';
  static const String _email = 'email';
  static const String _seqCliente = 'SeqCliente';
  static const String _precoEsp = 'PrecoEsp';
  static const String _mercado = 'Mercado';

  Future<int> salvar(Dispositivo dispositivo) async {
    final Database db = await getDatabase();
    Map<String, dynamic> dispositivoMap = dispositivo.toMap();
    print('-----');
    print(dispositivoMap.toString());
    print('-----');

    return db.insert(_tableName, dispositivoMap);
  }

// TODO FAZER A BUSCA DO DISPOSITIVO

  // Future<List<Dispositivo>> findAll() async {
  //   final Database db = await getDatabase();
  //   final List<Map<String, dynamic>> result = await db.query(_tableName);
  //   // final List<Map> result = await db.rawQuery("SELECT * FROM $_tableName");
  //   final List<Dispositivo> listaDeDispositivos = [];
  //   for (var dispositivo in result) {
  //     listaDeDispositivos.add(Dispositivo.fromMap(dispositivo));
  //   }
  //   // result.forEach((v) => listaDeClientes.add(Cliente.fromMap(v)));

  //   return listaDeDispositivos;
  // }

  Future<Dispositivo> find() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    Dispositivo dispositivoEncontrado = Dispositivo.fromMap(result.first);
    // final List<Dispositivo> listaDeDispositivos = [];
    // for (var dispositivo in result) {
    //   listaDeDispositivos.add(Dispositivo.fromMap(dispositivo));
    // }
    // Dispositivo dispositivoFind = listaDeDispositivos.first;
    print('------- find dispositivoDao --------');
    print(dispositivoEncontrado);
    print('------- find dispositivoDao --------');
    return dispositivoEncontrado;
  }

  Future<int> update() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_tableName);
    Dispositivo dispositivoEncontrado = Dispositivo.fromMap(resultado.first);

    final Map<String, dynamic> dispositivoMap = dispositivoEncontrado.toMap();
    print('VALOR DA SEQCLIENTE ANTES');
    print(dispositivoMap['SeqCliente']);
    var seqCliente = int.parse(dispositivoMap['SeqCliente']) + 1;
    dispositivoMap['SeqCliente'] = seqCliente.toString();
    print('VALOR DA SEQCLIENTE DEPOIS');
    print(dispositivoMap['SeqCliente']);
    return db.update(
      _tableName,
      dispositivoMap,
      where: 'DispositivoID = ?',
      whereArgs: [dispositivoEncontrado.dispositivoId],
    );
  }

  Future<int> deleteAll() async {
    try {
      final Database db = await getDatabase();
      return db.delete(_tableName);
    } catch (e) {
      print('Erro ao excluir todos os registros: $e');
      return -1; // Retorna -1 em caso de erro
    }
  }
}

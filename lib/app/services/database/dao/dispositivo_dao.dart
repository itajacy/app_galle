/* 
Data: 20/08/2024
*/
import '../../../models/dispositivo.dart';
import 'package:galle/app/services/database/app_database.dart';
import 'package:sqflite/sqflite.dart';

class DispositivoDao {
  static const String tabelaDispositivo = 'CREATE TABLE $_tableName('
      '$_id INTEGER, '
      '$_dispositivoId INTEGER, '
      '$_address TEXT, '
      '$_urlImagens TEXT, '
      '$_representanteIdInt TEXT, '
      '$_usuarioFtp TEXT, '
      '$_senhaFtp TEXT, '
      '$_email TEXT)';

  static const String _tableName = 'dispositivo';
  static const String _id = 'id';
  static const String _dispositivoId = 'DispositivoID';
  static const String _address = 'address';
  static const String _urlImagens = 'urlIimagens';
  static const String _representanteIdInt = 'RepresentanteID_Int';
  static const String _usuarioFtp = 'usuarioFtp';
  static const String _senhaFtp = 'senhaFtp';
  static const String _email = 'email';

  Future<int> salvar(Dispositivo dispositivo) async {
    final Database db = await getDatabase();
    Map<String, dynamic> dispositivoMap = dispositivo.toMap();
    print('-----');
    print(dispositivoMap.toString());
    print('-----');

    return db.insert(_tableName, dispositivoMap);
  }
}

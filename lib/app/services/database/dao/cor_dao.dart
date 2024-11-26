/*
22/08/2024
*/

import 'package:galle/app/models/cor.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class CorDao {
  static const String tabelaCor = 'CREATE TABLE $_tableName ('
      '$_corId INTEGER PRIMARY KEY, '
      '$_corIdInt TEXT, '
      '$_descricao TEXT)';
  // static const String tabelaCor = 'CREATE TABLE $_tableName ('
  //     '$_corId INTEGER, '
  //     '$_corIdInt TEXT, '
  //     '$_descricao TEXT, '
  //     '$_ativo INTEGER)';

  static const _tableName = 'cor';
  static const String _corId = 'corId';
  static const String _corIdInt = 'CorID_Int';
  static const String _descricao = 'Descricao';

  Future<int> salvar(Cor cor) async {
    final Database db = await getDatabase();
    Map<String, dynamic> corMap = cor.toMap();
    print('-----');
    print(corMap.toString());
    print('-----');

    return db.insert(_tableName, corMap);
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

  Future<List<Cor>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Cor> listaDeCores = [];
    for (var cor in result) {
      listaDeCores.add(Cor.fromMap(cor));
    }
    return listaDeCores;
  }

  Future<List<Cor>> findCores(String descricaoDaCor) async {
    print('findClientes em clientes_dao--> $descricaoDaCor');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'Descricao LIKE ?',
      whereArgs: [
        '%$descricaoDaCor%',
      ],
    );
    final List<Cor> listaDeCores = [];
    for (var item in result) {
      listaDeCores.add(Cor.fromMap(item));
    }
    print('---inicio da lista de cores findCores---');
    print(listaDeCores.toString());
    print('---fim da lista de Cores findCores---');

    return listaDeCores;
  }
}

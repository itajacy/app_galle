/*
23/08/2024
*/

import 'package:sqflite/sqflite.dart';

import '../../../models/tipo.dart';
import '../app_database.dart';

class TipoDao {
  static const String tabelaTipo = 'CREATE TABLE $_tableName ('
      '$_tipoId INTEGER PRIMARY KEY, '
      '$_tipoIdInt TEXT, '
      '$_descricao TEXT, '
      '$_ativo INTEGER)';

  static const String _tableName = 'tipo';
  static const String _tipoId = 'tipoId';
  static const String _tipoIdInt = 'TipoID_Int';
  static const String _descricao = 'Descricao';
  static const String _ativo = 'ativo';

  Future<int> salvar(Tipo tipo) async {
    final Database db = await getDatabase();
    Map<String, dynamic> tipoMap = tipo.toMap();
    print('-----');
    print(tipoMap.toString());
    print('-----');

    return db.insert(_tableName, tipoMap);
  }

  Future<int> deleteAll() async {
    try {
      final Database db = await getDatabase();
      return db.delete(_tableName);
    } catch (e) {
      print('Erro ao excluir todos os registros da tabela $_tableName: $e');
      return -1; // Retorna -1 em caso de erro
    }
  }

  Future<List<Tipo>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Tipo> listaDeTipos = [];
    for (var tipo in result) {
      listaDeTipos.add(Tipo.fromMap(tipo));
    }
    return listaDeTipos;
  }

  Future<List<Tipo>> findTipos(String descricaoDoTipo) async {
    print('findTipos em Tipo_dao--> $descricaoDoTipo');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'Descricao LIKE ?',
      whereArgs: [
        '%$descricaoDoTipo%',
      ],
    );
    final List<Tipo> listaDeTipos = [];
    for (var tipo in result) {
      listaDeTipos.add(Tipo.fromMap(tipo));
    }
    print('---inicio da lista de grupos findTipos---');
    print(listaDeTipos.toString());
    print('---fim da lista de Tipos findTipos---');

    return listaDeTipos;
  }
}

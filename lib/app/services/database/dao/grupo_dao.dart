/*
22/08/2024
*/
import 'package:sqflite/sqflite.dart';

import '../../../models/grupo.dart';
import '../app_database.dart';

class GrupoDao {
  static const String tabelaGrupo = 'CREATE TABLE $_tableName ('
      '$_grupoId INTEGER, '
      '$_grupoIdInt TEXT, '
      '$_descricao TEXT, '
      '$_ativo INTEGER)';

  static const _tableName = 'grupo';
  static const String _grupoId = 'grupoId';
  static const String _grupoIdInt = 'grupoIdInt';
  static const String _descricao = 'descricao';
  static const String _ativo = 'ativo';

  Future<int> salvar(Grupo grupo) async {
    final Database db = await getDatabase();
    Map<String, dynamic> grupoMap = grupo.toMap();
    print('-----');
    print(grupoMap.toString());
    print('-----');

    return db.insert(_tableName, grupoMap);
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

  Future<List<Grupo>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Grupo> listaDeGrupos = [];
    for (var grupo in result) {
      listaDeGrupos.add(Grupo.fromMap(grupo));
    }
    return listaDeGrupos;
  }

  Future<List<Grupo>> findGrupos(String descricaoDoGrupo) async {
    print('findGrupos em grupo_dao--> $descricaoDoGrupo');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'Descricao LIKE ?',
      whereArgs: [
        '%$descricaoDoGrupo%',
      ],
    );
    final List<Grupo> listaDeGrupos = [];
    for (var grupo in result) {
      listaDeGrupos.add(Grupo.fromMap(grupo));
    }
    print('---inicio da lista de grupos findGrupos---');
    print(listaDeGrupos.toString());
    print('---fim da lista de grupos findGrupos---');

    return listaDeGrupos;
  }
}

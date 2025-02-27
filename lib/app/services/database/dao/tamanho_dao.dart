/*
23/08/2024
*/

import 'package:sqflite/sqflite.dart';

import '../../../models/tamanho.dart';
import '../app_database.dart';

class TamanhoDao {
  static const String tabelaTamanho = 'CREATE TABLE $_tableName ('
      '$_tamanhoId INTEGER PRIMARY KEY, '
      '$_tamanhoIdInt TEXT, '
      '$_descricao TEXT, '
      '$_ativo INTEGER)';

  static const String _tableName = 'tamanho';
  static const String _tamanhoId = 'tamanhoId';
  static const String _tamanhoIdInt = 'TamanhoID_Int';
  static const String _descricao = 'Descricao';
  static const String _ativo = 'ativo';

  Future<int> salvar(Tamanho tamanho) async {
    final Database db = await getDatabase();
    Map<String, dynamic> tamanhoMap = tamanho.toMap();
    print('-----');
    print(tamanhoMap.toString());
    print('-----');

    return db.insert(_tableName, tamanhoMap);
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

  Future<List<Tamanho>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Tamanho> listaDeTamanhos = [];
    for (var tamanho in result) {
      listaDeTamanhos.add(Tamanho.fromMap(tamanho));
    }
    return listaDeTamanhos;
  }

  Future<List<Tamanho>> findTamanhos(String descricaoDoTamanho) async {
    print('findTamanhos em Tamanho_dao--> $descricaoDoTamanho');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'Descricao LIKE ?',
      whereArgs: [
        '%$descricaoDoTamanho%',
      ],
    );
    final List<Tamanho> listaDeTamanhos = [];
    for (var tamanho in result) {
      listaDeTamanhos.add(Tamanho.fromMap(tamanho));
    }
    print('---inicio da lista de grupos findTamanhos---');
    print(listaDeTamanhos.toString());
    print('---fim da lista de Tamanhos findTamanhos---');

    return listaDeTamanhos;
  }
}

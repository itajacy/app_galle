/*
22/08/2024
*/

import 'package:galle/app/models/linha.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class LinhaDao {
  static const String tabelaLinha = 'CREATE TABLE $_tableName ('
      '$_linhaId INTEGER, '
      '$_linhaIdInt TEXT, '
      '$_descricao TEXT,'
      '$_ativo INTEGER)';

  static const String _tableName = 'linha';
  static const String _linhaId = 'linhaId';
  static const String _linhaIdInt = 'LinhaID_Int';
  static const String _descricao = 'Descricao';
  static const String _ativo = 'ativo';

  Future<int> salvar(Linha linha) async {
    final Database db = await getDatabase();
    Map<String, dynamic> linhaMap = linha.toMap();
    print('-----');
    print(linhaMap.toString());
    print('-----');

    return db.insert(_tableName, linhaMap);
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

  Future<List<Linha>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Linha> listaDeLinhas = [];
    for (var linha in result) {
      listaDeLinhas.add(Linha.fromMap(linha));
    }
    return listaDeLinhas;
  }

  Future<List<Linha>> findLinhas(String descricaoDoLinha) async {
    print('findLinhas em Linha_dao--> $descricaoDoLinha');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'Descricao LIKE ?',
      whereArgs: [
        '%$descricaoDoLinha%',
      ],
    );
    final List<Linha> listaDeLinhas = [];
    for (var linha in result) {
      listaDeLinhas.add(Linha.fromMap(linha));
    }
    print('---inicio da lista de grupos findLinhas---');
    print(listaDeLinhas.toString());
    print('---fim da lista de Linhas findLinhas---');

    return listaDeLinhas;
  }
}

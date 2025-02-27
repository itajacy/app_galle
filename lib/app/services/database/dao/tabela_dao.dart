import 'package:sqflite/sqflite.dart';

import '../../../models/tabela.dart';
import '../app_database.dart';

class TabelaDao {
  static const tabelaTabela = 'CREATE TABLE $_tableName('
      '$_tabelaId INTEGER PRIMARY KEY, '
      '$_tabelaIdInt TEXT, '
      '$_descricao TEXT, '
      '$_ativo INTEGER)';

  static const String _tableName = 'tabela';
  static const String _tabelaId = 'tabelaId';
  static const String _tabelaIdInt = 'TabelaID_Int';
  static const String _descricao = 'Descricao';
  static const String _ativo = 'ativo';

  Future<int> salvar(Tabela tabela) async {
    final Database db = await getDatabase();
    Map<String, dynamic> tabelaMap = tabela.toMap();
    print('-----');
    print(tabelaMap.toString());
    print('-----');

    return db.insert(_tableName, tabelaMap);
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

  Future<List<Tabela>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Tabela> listaDeTabelas = [];
    for (var tabela in result) {
      listaDeTabelas.add(Tabela.fromMap(tabela));
    }
    return listaDeTabelas;
  }

  Future<List<Tabela>> findTabelas(String descricaoDoTabela) async {
    print('findTabelas em Tabela_dao--> $descricaoDoTabela');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'Descricao LIKE ?',
      whereArgs: [
        '%$descricaoDoTabela%',
      ],
    );
    final List<Tabela> listaDeTabelas = [];
    for (var tabela in result) {
      listaDeTabelas.add(Tabela.fromMap(tabela));
    }
    print('---inicio da lista de grupos findTabelas---');
    print(listaDeTabelas.toString());
    print('---fim da lista de Tabelas findTabelas---');

    return listaDeTabelas;
  }
}

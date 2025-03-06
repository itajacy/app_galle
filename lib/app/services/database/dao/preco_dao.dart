/*
22/08/2024
*/

import 'package:sqflite/sqflite.dart';

import '../../../models/preco.dart';
import '../app_database.dart';

class PrecoDao {
  static const String tabelaPreco = 'CREATE TABLE $_tableName ('
      '$_precoId INTEGER PRIMARY KEY, '
      '$_tabelaId INTEGER, '
      '$_produtoId INTEGER, '
      '$_precoGrama INTEGER, '
      '$_preco REAL, '
      '$_ativo INTEGER)';

  static const String _tableName = 'preco';
  static const String _precoId = 'precoId';
  static const String _tabelaId = 'TabelaID_Int';
  static const String _produtoId = 'ProdutoID_Int';
  static const String _precoGrama = 'PrecoGrama';
  static const String _preco = 'Preco';
  static const String _ativo = 'ativo';

  //_

  Future<int> salvar(Preco preco) async {
    final Database db = await getDatabase();
    Map<String, dynamic> precoMap = preco.toMap();
    print('-----');
    print(precoMap.toString());
    print('-----');

    return db.insert(_tableName, precoMap);
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

  Future<List<Preco>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Preco> listaDePrecos = [];
    for (var preco in result) {
      listaDePrecos.add(Preco.fromMap(preco));
    }
    return listaDePrecos;
  }

// TODO FALTA NA PESQUISA DO PRECO COLOCAR PARA BUSCAR a tabela TAMBÉM
// TODO TEM QUE BUSCAR PELA TABELA E PELO PRODUTO

  Future<List<Preco>> findPrecos(int tabela, String produto) async {
    print('findPrecos em precos_dao--> $tabela , $produto');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      //!  falta buscar pela tabela
      where: 'ProdutoID_Int LIKE ?',
      whereArgs: [
        //!  falta buscar pela tabela
        '%$produto%',
      ],
    );
    final List<Preco> listaDePrecos = [];
    for (var item in result) {
      listaDePrecos.add(Preco.fromMap(item));
    }
    print('---inicio da lista de precoes findPrecos---');
    print(listaDePrecos.toString());
    print('---fim da lista de Precos findPrecos---');

    return listaDePrecos;
  }
}

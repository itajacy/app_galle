/*
23/08/2024
*/

import 'package:sqflite/sqflite.dart';

import '../../../models/produto.dart';
import '../app_database.dart';

class ProdutoDao {
  static const String tabelaProduto = 'CREATE TABLE $_tableName ('
      '$_produtoId INTEGER PRIMARY KEY, '
      '$_produtoIdInt TEXT, '
      '$_descricao TEXT, '
      '$_imagemId TEXT, '
      '$_grupoId TEXT, '
      '$_linhaId TEXT, '
      '$_materialId TEXT, '
      '$_corId TEXT, '
      '$_tamanhoId TEXT, '
      '$_tipoId TEXT, '
      '$_larguraMM INTEGER, '
      '$_alturaMM INTEGER, '
      '$_peso REAL, '
      '$_ativo BOOLEAN, '
      '$_lancamento INTEGER, '
      '$_lctoData INTEGER)';

  static const String _tableName = 'produto';
  static const String _produtoId = 'produtoId';
  static const String _produtoIdInt = 'ProdutoID_Int';
  static const String _descricao = 'Descricao';
  static const String _imagemId = 'ImagemID';
  static const String _grupoId = 'GrupoID_Int';
  static const String _linhaId = 'LinhaID_Int';
  static const String _materialId = 'MaterialID_Int';
  static const String _corId = 'CorID_Int';
  static const String _tamanhoId = 'TamanhoID_Int';
  static const String _tipoId = 'TipoID_Int';
  static const String _larguraMM = 'Largura_MM';
  static const String _alturaMM = 'Altura_MM';
  static const String _peso = 'peso';
  static const String _ativo = 'ativo';
  static const String _lancamento = 'Lancamento';
  static const String _lctoData = 'LctoData';

Future<int> salvar(Produto produto) async {
    final Database db = await getDatabase();
    Map<String, dynamic> produtoMap = produto.toMap();
    print('-----');
    print(produtoMap.toString());
    print('-----');

    return db.insert(_tableName, produtoMap);
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

  Future<List<Produto>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Produto> listaDeProdutos = [];
    for (var produto in result) {
      listaDeProdutos.add(Produto.fromMap(produto));
    }
    return listaDeProdutos;
  }

  Future<List<Produto>> findProdutos(String codigoDoProduto) async {
    print('findProdutos em grupo_dao--> $codigoDoProduto');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'ProdutoID_Int LIKE ?',
      whereArgs: [
        '%$codigoDoProduto%',
      ],
    );
    final List<Produto> listaDeProdutos = [];
    for (var produto in result) {
      listaDeProdutos.add(Produto.fromMap(produto));
    }
    print('---inicio da lista de grupos findProdutos---');
    print(listaDeProdutos.toString());
    print('---fim da lista de grupos findProdutos---');

    return listaDeProdutos;
  }


}

/*
22/08/2024
*/

class PrecoDao {
  static const String tabelaPreco = 'CREATE TABLE $_tableName ('
      '$_precoId INTEGER, '
      '$_tabelaId INTEGER, '
      '$_produtoId INTEGER, '
      '$_precoEmGrama INTEGER, '
      '$_preco REAL, '
      '$_ativo INTEGER)';

  static const String _tableName = 'preco';
  static const String _precoId = 'precoId';
  static const String _tabelaId = 'tabelaId';
  static const String _produtoId = 'produtoId';
  static const String _precoEmGrama = 'precoEmGrama';
  static const String _preco = 'preco';
  static const String _ativo = 'ativo';
}

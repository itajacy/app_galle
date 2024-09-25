//* criado em 24/08/2024

class CatalogoItemDao {
  static const String tabelaCatalogoItem = 'CREATE TABLE $_tableName ('
      '$_catalogoItemId INTEGER, '
      '$_produtoId INTEGER, '
      '$_quantidade REAL, '
      '$_quantidadeEmGrama INTEGER, '
      '$_observacao TEXT)';

  static const String _tableName = 'catalogoItem';
  static const String _catalogoItemId = 'catalogoItemId';
  static const String _produtoId = 'produtoId';
  static const String _quantidade = 'quantidade';
  static const String _quantidadeEmGrama = 'quantidadeEmGrama';
  static const String _observacao = 'observacao';
}

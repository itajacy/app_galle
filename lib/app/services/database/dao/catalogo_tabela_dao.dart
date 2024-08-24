/*
24/08/2024
*/

class CatalogoTabelaDao {
  static const String tabelaCatalogoTabela = 'CREATE TABLE $_tableName ('
      '$_catalogoTabelaId INTEGER, '
      '$_tabelaId INTEGER, '
      '$_fator REAL)';

  static const String _tableName = 'catalogoTabela';
  static const String _catalogoTabelaId = 'catalogoTabelaId';
  static const String _tabelaId = 'tabelaId';
  static const String _fator = 'fator';
}

/*
24/08/2024
*/

class CatalogoDao {
  static const String tabelaCatalogo = 'CREATE TABLE $_tableName ('
      '$_grupoId INTEGER, '
      '$_corId INTEGER, '
      '$_tamanhoId INTEGER, '
      '$_tipoId INTEGER, '
      '$_linhaId INTEGER, '
      '$_materialId INTEGER, '
      '$_precoMin REAL, '
      '$_precoMax REAL, '
      '$_precoEmGrama INTEGER, '
      '$_pesoMin REAL, '
      '$_pesoMax REAL, '
      '$_lancamento INTEGER, '
      '$_ordem INTEGER)';

  static const String _tableName = 'catalogo';
  static const String _grupoId = 'grupoId';
  static const String _corId = 'corId';
  static const String _tamanhoId = 'tamanhoId';
  static const String _tipoId = 'tipoId';
  static const String _linhaId = 'linhaId';
  static const String _materialId = 'materialId';
  static const String _precoMin = 'precoMin';
  static const String _precoMax = 'precoMax';
  static const String _precoEmGrama = 'precoEmGrama';
  static const String _pesoMin = 'pesoMin';
  static const String _pesoMax = 'pesoMax';
  static const String _lancamento = 'lancamento';
  static const String _ordem = 'ordem';
}

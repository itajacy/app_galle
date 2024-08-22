/*
22/08/2024
*/
class CorDao {
  static const String tabelaCor = 'CREATE TABLE $_tableName ('
      '$_corId INTEGER, '
      '$_corIdInt TEXT, '
      '$_decricao TEXT, '
      '$_ativo INTEGER)';

  static const _tableName = 'cor';
  static const String _corId = 'corId';
  static const String _corIdInt = 'corIdInt';
  static const String _decricao = 'decricao';
  static const String _ativo = 'ativo';
}

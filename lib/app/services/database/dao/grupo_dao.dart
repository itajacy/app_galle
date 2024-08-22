/*
22/08/2024
*/
class GrupoDao {
  static const String tabelaGrupo = 'CREATE TABLE $_tableName ('
      '$_grupoId INTEGER, '
      '$_grupoIdInt TEXT, '
      '$_decricao TEXT, '
      '$_ativo INTEGER)';

  static const _tableName = 'grupo';
  static const String _grupoId = 'grupoId';
  static const String _grupoIdInt = 'grupoIdInt';
  static const String _decricao = 'decricao';
  static const String _ativo = 'ativo';
}

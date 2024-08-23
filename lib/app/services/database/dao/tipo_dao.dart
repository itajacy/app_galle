/*
23/08/2024
*/

class TipoDao {
  static const String tabelaTipo = 'CREATE TABLE $_tableName ('
      '$_tipoId INTEGER, '
      '$_tipoIdInt TEXT, '
      '$_descricao TEXT, '
      '$_ativo INTEGER)';

  static const String _tableName = 'tipo';
  static const String _tipoId = 'tipoId';
  static const String _tipoIdInt = 'tipoIdInt';
  static const String _descricao = 'descricao';
  static const String _ativo = 'ativo';
}

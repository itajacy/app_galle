/*
22/08/2024
*/

class LinhaDao {
  static const String tabelaLinha = 'CREATE TABLE $_tableName ('
      '$_linhaId INTEGER, '
      '$_linhaIdInt TEXT, '
      '$_descricao TEXT,'
      '$_ativo INTEGER)';

  static const String _tableName = 'linha';
  static const String _linhaId = 'linhaId';
  static const String _linhaIdInt = 'LinhaID_Int';
  static const String _descricao = 'Descricao';
  static const String _ativo = 'ativo';
}

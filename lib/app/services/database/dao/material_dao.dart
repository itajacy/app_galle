/*
22/08/2024
*/

class MaterialDao {
  static const String tabelaMaterial = 'CREATE TABLE $_tableName ('
      '$_materialId INTEGER, '
      '$_materialIdInt TEXT, '
      '$_descricao TEXT, '
      '$_ativo INTEGER)';

  static const String _tableName = 'material';
  static const String _materialId = 'materialId';
  static const String _materialIdInt = 'materialIdInt';
  static const String _descricao = 'descricao';
  static const String _ativo = 'ativo';
}

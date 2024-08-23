/*
23/08/2024
*/

class TamanhoDao {
  static const String tabelaTamanho = 'CREATE TABLE $_tableName ('
      '$_tamanhoId INTEGER, '
      '$_tamanhoIdInt TEXT, '
      '$_descricao TEXT, '
      '$_ativo INTEGER)';

  static const String _tableName = 'tamanho';
  static const String _tamanhoId = 'tamanhoId';
  static const String _tamanhoIdInt = 'tamanhoIdInt';
  static const String _descricao = 'descricao';
  static const String _ativo = 'ativo';
}

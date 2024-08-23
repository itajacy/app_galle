/*
23/08/2024
*/

class ProdutoDao {
  static const String tabelaProduto = 'CREATE TABLE $_tableName ('
      '$_produtoId INTEGER, '
      '$_produtoIdInt TEXT, '
      '$_descricao TEXT, '
      '$_imagemId TEXT, '
      '$_grupoId INTEGER, '
      '$_linhaId INTEGER, '
      '$_materialId INTEGER, '
      '$_corId INTEGER, '
      '$_tamanhoId INTEGER, '
      '$_tipoId INTEGER, '
      '$_larguraMM INTEGER, '
      '$_alturaMM INTEGER, '
      '$_peso REAL, '
      '$_ativo, INTEGER'
      '$_lancamento INTEGER, '
      '$_lctoData DATETIME)';

  static const String _tableName = 'produto';
  static const String _produtoId = 'produtoId';
  static const String _produtoIdInt = 'produtoIdInt';
  static const String _descricao = 'descricao';
  static const String _imagemId = 'imagemId';
  static const String _grupoId = 'grupoId';
  static const String _linhaId = 'linhaId';
  static const String _materialId = 'materialId';
  static const String _corId = 'corId';
  static const String _tamanhoId = 'tamanhoId';
  static const String _tipoId = 'tipoId';
  static const String _larguraMM = 'larguraMM';
  static const String _alturaMM = 'alturaMM';
  static const String _peso = 'peso';
  static const String _ativo = 'ativo';
  static const String _lancamento = 'lancamento';
  static const String _lctoData = 'lctoData';
}

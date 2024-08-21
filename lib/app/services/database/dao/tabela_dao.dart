class TabelaDao {
  static const tabelaTabela = 'CREATE TABLE $_tableName('
      '$_tabelaId INTEGER, '
      '$_tabelaIdInt TEXT, '
      '$_descricao TEXT, '
      '$_ativo INTEGER)';

  static const String _tableName = 'tabela';
  static const String _tabelaId = 'tabelaId';
  static const String _tabelaIdInt = 'tabelaIdInt';
  static const String _descricao = 'descricao';
  static const String _ativo = 'ativo';
}

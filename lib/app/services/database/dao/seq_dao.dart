/*
23/08/2024
*/

class SeqDao {
  static const String tabelaSeq = 'CREATE TABLE $_tableName ('
      '$_tabela TEXT, '
      '$_id INTEGER)';

  static const String _tableName = 'seq';
  static const String _tabela = 'tabela';
  static const String _id = 'id';
}

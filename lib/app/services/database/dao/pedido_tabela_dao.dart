class PedidoTabelaDao {
  static const String tabelaPedidoTabela = 'CREATE TABLE $_tableName ('
      '$_pedidoTabelaId INTEGER, '
      '$_pedidoId INTEGER, '
      '$_tabelaId INTEGER, '
      '$_fator REAL)';

  static const String _tableName = 'pedidoTabela';
  static const String _pedidoTabelaId = 'pedidoTabelaId';
  static const String _pedidoId = 'pedidoId';
  static const String _tabelaId = 'tabelaId';
  static const String _fator = 'fator';
}

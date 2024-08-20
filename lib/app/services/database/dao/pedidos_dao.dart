class PedidosDao {
  static const String tabelaPedidos = 'CREATE TABLE $_tableName('
      '$_pedidoId INTEGER PRIMARY KEY, '
      '$_clienteId INTEGER, '
      '$_status TEXT, '
      '$_dataInclusao TEXT, '
      '$_dataAlteracao TEXT, '
      '$_dataTransmissao TEXT, '
      '$_observacao TEXT)';

  static const String _tableName = 'pedidos';
  static const String _pedidoId = 'pedidoId';
  static const String _clienteId = 'clienteId';
  static const String _status = 'status';
  static const String _dataInclusao = 'dataInclusao';
  static const String _dataAlteracao = 'dataAlteracao';
  static const String _dataTransmissao = 'dataTransmissao';
  static const String _observacao = 'observacao';
}

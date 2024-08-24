/*
22/08/2024
*/
class PedidoItemDao {
  static const String tabelaPedidoItem = 'CREATE TABLE $_tableName ('
      '$_pedidoItemId INTEGER, '
      '$_pedidoId INTEGER, '
      '$_produtoId INTEGER, '
      '$_quantidade REAL, '
      '$_quantidadeEmGrama REAL, '
      '$_observacao TEXT)';

  static const String _tableName = 'pedidoItem';
  static const String _pedidoItemId = 'pedidoItemId';
  static const String _pedidoId = 'pedidoId';
  static const String _produtoId = '_produtoId';
  static const String _quantidade = 'quantidade';
  static const String _quantidadeEmGrama = 'quantidadeEmGrama';
  static const String _observacao = 'observacao';
}

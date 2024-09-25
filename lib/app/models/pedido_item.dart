//* criado em 22/08/2024
class PedidoItem {
  int? pedidoItemId;
  int? pedidoId;
  int? produtoId;
  double? quantidade;
  int? quantidadeEmGrama;
  String? observacao;

  PedidoItem({
    this.pedidoItemId,
    this.pedidoId,
    this.produtoId,
    this.quantidade,
    this.quantidadeEmGrama,
    this.observacao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pedidoItemId': pedidoItemId,
      'pedidoId': pedidoId,
      'produtoId': produtoId,
      'quantidade': quantidade,
      'quantidadeEmGrama': quantidadeEmGrama,
      'observacao': observacao,
    };
  }

  factory PedidoItem.fromMap(Map<String, dynamic> mapaPedidoItem) {
    return PedidoItem(
      pedidoItemId: mapaPedidoItem['pedidoItemId'] != null
          ? mapaPedidoItem['pedidoItemId'] as int
          : null,
      pedidoId: mapaPedidoItem['pedidoId'] != null
          ? mapaPedidoItem['pedidoId'] as int
          : null,
      produtoId: mapaPedidoItem['produtoId'] != null
          ? mapaPedidoItem['produtoId'] as int
          : null,
      quantidade: mapaPedidoItem['quantidade'] != null
          ? mapaPedidoItem['quantidade'] as double
          : null,
      quantidadeEmGrama: mapaPedidoItem['quantidadeEmGrama'] != null
          ? mapaPedidoItem['quantidadeEmGrama'] as int
          : null,
      observacao: mapaPedidoItem['observacao'] != null
          ? mapaPedidoItem['observacao'] as String
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory PedidoItem.fromJson(String source) => PedidoItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PedidoItem(pedidoItemId: $pedidoItemId, pedidoId: $pedidoId, produtoId: $produtoId, quantidade: $quantidade, quantidadeEmGrama: $quantidadeEmGrama, observacao: $observacao)';
  }
}

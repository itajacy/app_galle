//* alterado em 24/09/24

class PedidoTabela {
  int? pedidoTabelaId;
  int? pedidoId;
  int? tabelaId;
  double? fator;

  PedidoTabela({
    this.pedidoTabelaId,
    this.pedidoId,
    this.tabelaId,
    this.fator,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pedidoTabelaId': pedidoTabelaId,
      'pedidoId': pedidoId,
      'tabelaId': tabelaId,
      'fator': fator,
    };
  }

  factory PedidoTabela.fromMap(Map<String, dynamic> mapapedidoTabela) {
    return PedidoTabela(

      pedidoTabelaId: mapapedidoTabela['pedidoTabelaId'] != null
          ? mapapedidoTabela['pedidoTabelaId'] as int
          : null,
      pedidoId: mapapedidoTabela['pedidoId'] != null
          ? mapapedidoTabela['pedidoId'] as int
          : null,
      tabelaId: mapapedidoTabela['tabelaId'] != null
          ? mapapedidoTabela['tabelaId'] as int
          : null,
      fator: mapapedidoTabela['fator'] != null
          ? mapapedidoTabela['fator'] as double
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory PedidoTabela.fromJson(String source) => PedidoTabela.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PedidoTabela( pedidoTabelaId: $pedidoTabelaId, pedidoId: $pedidoId, tabelaId: $tabelaId, fator: $fator)';
  }
}

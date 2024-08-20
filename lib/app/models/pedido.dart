class Pedido {
  int? pedidoId;
  int? clienteId;
  String? status;
  String? dataInclusao;
  String? dataAlteracao;
  String? dataTransmissao;
  String? observacao;

  Pedido({
    required this.pedidoId,
    this.clienteId,
    this.status,
    this.dataInclusao,
    this.dataAlteracao,
    this.dataTransmissao,
    this.observacao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pedidoId': pedidoId,
      'clienteId': clienteId,
      'status': status,
      'dataInclusao': dataInclusao,
      'dataAlteracao': dataAlteracao,
      'dataTransmissao': dataTransmissao,
      'observacao': observacao,
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> mapaPedido) {
    return Pedido(
      pedidoId: mapaPedido['pedidoId'] as int,
      clienteId: mapaPedido['clienteId'] as int,
      status: mapaPedido['status'],
      dataInclusao: mapaPedido['dataInclusao'],
      dataAlteracao: mapaPedido['dataAlteracao'],
      dataTransmissao: mapaPedido['dataTransmissao'],
      observacao: mapaPedido['observacao'],

      // pedidoId: mapaPedido['pedidoId'] != null ? mapaPedido['pedidoId'] as int : null,
      // clienteId: mapaPedido['clienteId'] != null ? mapaPedido['clienteId'] as int : null,
      // status: mapaPedido['status'] != null ? mapaPedido['status'] as String : null,
      // dataInclusao: mapaPedido['dataInclusao'] != null ? mapaPedido['dataInclusao'] as String : null,
      // dataAlteracao: mapaPedido['dataAlteracao'] != null ? mapaPedido['dataAlteracao'] as String : null,
      // dataTransmissao: mapaPedido['dataTransmissao'] != null ? mapaPedido['dataTransmissao'] as String : null,
      // observacao: mapaPedido['observacao'] != null ? mapaPedido['observacao'] as String : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Pedido.fromJson(String source) =>
  //     Pedido.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pedido(pedidoId: $pedidoId, clienteId: $clienteId, status: $status, dataInclusao: $dataInclusao, dataAlteracao: $dataAlteracao, dataTransmissao: $dataTransmissao, observacao: $observacao)';
  }
}

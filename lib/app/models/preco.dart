//*  criado em 22/08/2024

class Preco {
  int? precoId;
  int? tabelaId;
  int? produtoId;
  int? precoEmGrama;
  double? preco;
  int? ativo;

  Preco({
    this.precoId,
    this.tabelaId,
    this.produtoId,
    this.precoEmGrama,
    this.preco,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'precoId': precoId,
      'tabelaId': tabelaId,
      'produtoId': produtoId,
      'precoEmGrama': precoEmGrama,
      'preco': preco,
      'ativo': ativo,
    };
  }

  factory Preco.fromMap(Map<String, dynamic> mapaPreco) {
    return Preco(
      precoId:
          mapaPreco['precoId'] != null ? mapaPreco['precoId'] as int : null,
      tabelaId:
          mapaPreco['tabelaId'] != null ? mapaPreco['tabelaId'] as int : null,
      produtoId:
          mapaPreco['produtoId'] != null ? mapaPreco['produtoId'] as int : null,
      precoEmGrama: mapaPreco['precoEmGrama'] != null
          ? mapaPreco['precoEmGrama'] as int
          : null,
      preco: mapaPreco['preco'] != null ? mapaPreco['preco'] as double : null,
      ativo: mapaPreco['ativo'] != null ? mapaPreco['ativo'] as int : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Preco.fromJson(String source) =>
  //     Preco.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Preco(precoId: $precoId, tabelaId: $tabelaId, produtoId: $produtoId, precoEmGrama: $precoEmGrama, preco: $preco, ativo: $ativo)';
  }
}

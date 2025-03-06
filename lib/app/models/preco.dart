//*  criado em 22/08/2024

class Preco {
  int? precoId;
  int? tabelaId; // 645
  String? produtoId; // código 01-002AG
  int? precoGrama; // 0 ou 1
  double? preco;
  int? ativo;

  Preco({
    this.precoId,
    this.tabelaId,
    this.produtoId,
    this.precoGrama,
    this.preco,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'precoId': precoId,
      'TabelaID_Int': tabelaId,
      'ProdutoID_Int': produtoId,
      'PrecoGrama': precoGrama,
      'Preco': preco,
      'ativo': ativo,
    };
  }

  factory Preco.fromMap(Map<String, dynamic> mapaPreco) {
    return Preco(
      precoId:
          mapaPreco['precoId'] != null ? mapaPreco['precoId'] as int : null,
      tabelaId: mapaPreco['TabelaID_Int'] != null
          ? int.parse(mapaPreco['TabelaID_Int'])
          : null,
      produtoId: mapaPreco['ProdutoID_Int'] != null
          ? mapaPreco['ProdutoID_Int'] as String
          : null,
      precoGrama: mapaPreco['PrecoGrama'] != null
          ? int.parse(mapaPreco['PrecoGrama'])
          : null,
      preco: mapaPreco['Preco'] != null
          ? double.tryParse(mapaPreco['Preco']) as double
          : null,
      ativo: mapaPreco['ativo'] != null ? mapaPreco['ativo'] as int : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Preco.fromJson(String source) =>
  //     Preco.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Preco(precoId: $precoId, tabelaId: $tabelaId, produtoId: $produtoId, precoEmGrama: $precoGrama, preco: $preco, ativo: $ativo)';
  }
}

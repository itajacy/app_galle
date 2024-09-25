//* criado em 24/08/2024


class CatalogoItem {
  int? catalogoItemId;
  int? produtoId;
  double? quantidade;
  int? quantidadeEmGrama;
  String? observacao;
  CatalogoItem({
    this.catalogoItemId,
    this.produtoId,
    this.quantidade,
    this.quantidadeEmGrama,
    this.observacao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'catalogoItemId': catalogoItemId,
      'produtoId': produtoId,
      'quantidade': quantidade,
      'quantidadeEmGrama': quantidadeEmGrama,
      'observacao': observacao,
    };
  }

  factory CatalogoItem.fromMap(Map<String, dynamic> mapaCatalogoitem) {
    return CatalogoItem(
      catalogoItemId: mapaCatalogoitem['catalogoItemId'] != null
          ? mapaCatalogoitem['catalogoItemId'] as int
          : null,
      produtoId: mapaCatalogoitem['produtoId'] != null
          ? mapaCatalogoitem['produtoId'] as int
          : null,
      quantidade: mapaCatalogoitem['quantidade'] != null
          ? mapaCatalogoitem['quantidade'] as double
          : null,
      quantidadeEmGrama: mapaCatalogoitem['quantidadeEmGrama'] != null
          ? mapaCatalogoitem['quantidadeEmGrama'] as int
          : null,
      observacao: mapaCatalogoitem['observacao'] != null
          ? mapaCatalogoitem['observacao'] as String
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory CatalogoItem.fromJson(String source) =>
  //     CatalogoItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CatalogoItem(catalogoItemId: $catalogoItemId, produtoId: $produtoId, quantidade: $quantidade, quantidadeEmGrama: $quantidadeEmGrama, observacao: $observacao)';
  }
}

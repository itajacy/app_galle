//* criado em 22/08/2024

class MaterialDoProduto {
  int? materialId;
  String? materialIdInt;
  String? descricao;
  int? ativo;

  MaterialDoProduto({
    this.materialId,
    this.materialIdInt,
    this.descricao,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'materialId': materialId,
      'MaterialID_Int': materialIdInt,
      'Descricao': descricao,
      'ativo': ativo,
    };
  }

  factory MaterialDoProduto.fromMap(Map<String, dynamic> mapaMaterial) {
    return MaterialDoProduto(
      materialId: mapaMaterial['materialId'] != null
          ? mapaMaterial['materialId'] as int
          : null,
      materialIdInt: mapaMaterial['MaterialID_Int'] != null
          ? mapaMaterial['MaterialID_Int'] as String
          : null,
      descricao: mapaMaterial['Descricao'] != null
          ? mapaMaterial['Descricao'] as String
          : null,
      ativo:
          mapaMaterial['ativo'] != null ? mapaMaterial['ativo'] as int : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Material.fromJson(String source) => Material.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Material(materialId: $materialId, materialIdInt: $materialIdInt, descricao: $descricao, ativo: $ativo)';
  }
}

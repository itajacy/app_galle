/*
22/08/2024
*/

class Material {
  int? materialId;
  String? materialIdInt;
  String? descricao;
  int? ativo;

  Material({
    this.materialId,
    this.materialIdInt,
    this.descricao,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'materialId': materialId,
      'materialIdInt': materialIdInt,
      'descricao': descricao,
      'ativo': ativo,
    };
  }

  factory Material.fromMap(Map<String, dynamic> mapaMaterial) {
    return Material(
      materialId: mapaMaterial['materialId'] != null
          ? mapaMaterial['materialId'] as int
          : null,
      materialIdInt: mapaMaterial['materialIdInt'] != null
          ? mapaMaterial['materialIdInt'] as String
          : null,
      descricao: mapaMaterial['descricao'] != null
          ? mapaMaterial['descricao'] as String
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

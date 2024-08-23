/*
23/08/2024
*/

class Tipo {
  int? tipoId;
  String? tipoIdInt;
  String? descricao;
  int? ativo;
  Tipo({
    this.tipoId,
    this.tipoIdInt,
    this.descricao,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tipoId': tipoId,
      'tipoIdInt': tipoIdInt,
      'descricao': descricao,
      'ativo': ativo,
    };
  }

  factory Tipo.fromMap(Map<String, dynamic> mapaTipo) {
    return Tipo(
      tipoId: mapaTipo['tipoId'] != null ? mapaTipo['tipoId'] as int : null,
      tipoIdInt: mapaTipo['tipoIdInt'] != null
          ? mapaTipo['tipoIdInt'] as String
          : null,
      descricao: mapaTipo['descricao'] != null
          ? mapaTipo['descricao'] as String
          : null,
      ativo: mapaTipo['ativo'] != null ? mapaTipo['ativo'] as int : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Tipo.fromJson(String source) =>
  //     Tipo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Tipo(tipoId: $tipoId, tipoIdInt: $tipoIdInt, descricao: $descricao, ativo: $ativo)';
  }
}

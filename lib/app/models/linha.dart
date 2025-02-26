//* criado em 22/08/2024

class Linha {
  int? linhaId;
  String? linhaIdInt;
  String? descricao;
  int? ativo;

  Linha({
    this.linhaId,
    this.linhaIdInt,
    this.descricao,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'linhaId': linhaId,
      'LinhaID_Int': linhaIdInt,
      'Descricao': descricao,
      'ativo': ativo,
    };
  }

  factory Linha.fromMap(Map<String, dynamic> mapaLinha) {
    return Linha(
      linhaId:
          mapaLinha['linhaId'] != null ? mapaLinha['linhaId'] as int : null,
      linhaIdInt: mapaLinha['LinhaID_Int'] != null
          ? mapaLinha['LinhaID_Int'] as String
          : null,
      descricao: mapaLinha['Descricao'] != null
          ? mapaLinha['Descricao'] as String
          : null,
      ativo: mapaLinha['ativo'] != null ? mapaLinha['ativo'] as int : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Linha.fromJson(String source) => Linha.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Linha(linhaId: $linhaId, linhaIdInt: $linhaIdInt, descricao: $descricao, ativo: $ativo)';
  }
}

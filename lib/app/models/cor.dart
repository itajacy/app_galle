//* criado em 22/08/2024

class Cor {
  int? corId;
  String? corIdInt;
  String? descricao;

  Cor({
    this.corId,
    this.corIdInt,
    this.descricao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'corId': corId,
      'CorID_Int': corIdInt,
      'Descricao': descricao,
    };
  }

  factory Cor.fromMap(Map<String, dynamic> mapaCor) {
    return Cor(
      corId: mapaCor['corId'] != null ? mapaCor['corId'] as int : null,
      corIdInt:
          mapaCor['CorID_Int'] != null ? mapaCor['CorID_Int'] as String : null,
      descricao:
          mapaCor['Descricao'] != null ? mapaCor['Descricao'] as String : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Cor.fromJson(String source) => Cor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cor(corId: $corId, corIdInt: $corIdInt, descricao: $descricao)';
  }
}

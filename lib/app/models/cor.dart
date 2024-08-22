/*
22/08/2024
*/

class Cor {
  int? corId;
  String? corIdInt;
  String? decricao;
  int? ativo;

  Cor({
    this.corId,
    this.corIdInt,
    this.decricao,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'corId': corId,
      'corIdInt': corIdInt,
      'decricao': decricao,
      'ativo': ativo,
    };
  }

  factory Cor.fromMap(Map<String, dynamic> map) {
    return Cor(
      corId: map['corId'] != null ? map['corId'] as int : null,
      corIdInt: map['corIdInt'] != null ? map['corIdInt'] as String : null,
      decricao: map['decricao'] != null ? map['decricao'] as String : null,
      ativo: map['ativo'] != null ? map['ativo'] as int : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Cor.fromJson(String source) => Cor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cor(corId: $corId, corIdInt: $corIdInt, decricao: $decricao, ativo: $ativo)';
  }
}

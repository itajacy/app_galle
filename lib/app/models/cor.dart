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

  factory Cor.fromMap(Map<String, dynamic> mapaCor) {
    return Cor(
      corId: mapaCor['corId'] != null ? mapaCor['corId'] as int : null,
      corIdInt:
          mapaCor['corIdInt'] != null ? mapaCor['corIdInt'] as String : null,
      decricao:
          mapaCor['decricao'] != null ? mapaCor['decricao'] as String : null,
      ativo: mapaCor['ativo'] != null ? mapaCor['ativo'] as int : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Cor.fromJson(String source) => Cor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cor(corId: $corId, corIdInt: $corIdInt, decricao: $decricao, ativo: $ativo)';
  }
}

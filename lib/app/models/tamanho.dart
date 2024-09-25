import 'dart:convert';

//* criado em 23/08/2024

class Tamanho {
  int? tamanhoId;
  String? tamanhoIdInt;
  String? descricao;
  int? ativo;

  Tamanho({
    this.tamanhoId,
    this.tamanhoIdInt,
    this.descricao,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tamanhoId': tamanhoId,
      'tamanhoIdInt': tamanhoIdInt,
      'descricao': descricao,
      'ativo': ativo,
    };
  }

  factory Tamanho.fromMap(Map<String, dynamic> map) {
    return Tamanho(
      tamanhoId: map['tamanhoId'] != null ? map['tamanhoId'] as int : null,
      tamanhoIdInt:
          map['tamanhoIdInt'] != null ? map['tamanhoIdInt'] as String : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      ativo: map['ativo'] != null ? map['ativo'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tamanho.fromJson(String source) =>
      Tamanho.fromMap(json.decode(source) as Map<String, dynamic>);
}

//* criado em 23/08/2024

class Seq {
  String? tabela;
  int? id;
  Seq({
    this.tabela,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tabela': tabela,
      'id': id,
    };
  }

  factory Seq.fromMap(Map<String, dynamic> mapaSeq) {
    return Seq(
      tabela: mapaSeq['tabela'] != null ? mapaSeq['tabela'] as String : null,
      id: mapaSeq['id'] != null ? mapaSeq['id'] as int : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Seq.fromJson(String source) => Seq.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Seq(tabela: $tabela, id: $id)';
}

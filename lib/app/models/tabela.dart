//* alterado em 24/09/24
class Tabela {
  int? tabelaId;
  String? tabelaIdInt;
  String? descricao;
  String? ativo;
  Tabela({
    this.tabelaId,
    this.tabelaIdInt,
    this.descricao,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tabelaId': tabelaId,
      'TabelaID_Int': tabelaIdInt,
      'Descricao': descricao,
      'ativo': ativo,
    };
  }

  factory Tabela.fromMap(Map<String, dynamic> mapaTabela) {
    return Tabela(
      tabelaId:
          mapaTabela['tabelaId'] != null ? mapaTabela['tabelaId'] as int : null,
      tabelaIdInt: mapaTabela['TabelaID_Int'] != null
          ? mapaTabela['TabelaID_Int'] as String
          : null,
      descricao: mapaTabela['Descricao'] != null
          ? mapaTabela['Descricao'] as String
          : null,
      ativo: mapaTabela['ativo'] != null ? mapaTabela['ativo'] as String : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Tabela.fromJson(String source) => Tabela.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Tabela(tabelaId: $tabelaId, tabelaIdInt: $tabelaIdInt, descricao: $descricao, ativo: $ativo)';
  }
}

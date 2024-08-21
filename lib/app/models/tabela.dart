import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      'tabelaIdInt': tabelaIdInt,
      'descricao': descricao,
      'ativo': ativo,
    };
  }

  factory Tabela.fromMap(Map<String, dynamic> mapaTabela) {
    return Tabela(
      tabelaId: mapaTabela['tabelaId'] as int,
      tabelaIdInt: mapaTabela['tabelaIdInt'],
      descricao: mapaTabela['descricao'],
      ativo: mapaTabela['ativo'],

      // tabelaId: mapaTabela['tabelaId'] != null ? mapaTabela['tabelaId'] as int : null,
      // tabelaIdInt:
      //     mapaTabela['tabelaIdInt'] != null ? mapaTabela['tabelaIdInt'] as String : null,
      // descricao: mapaTabela['descricao'] != null ? mapaTabela['descricao'] as String : null,
      // ativo: mapaTabela['ativo'] != null ? mapaTabela['ativo'] as String : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Tabela.fromJson(String source) => Tabela.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Tabela(tabelaId: $tabelaId, tabelaIdInt: $tabelaIdInt, descricao: $descricao, ativo: $ativo)';
  }
}

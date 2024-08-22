/*
22/08/2024
*/

class Grupo {
  int? grupoId;
  String? grupoIdInt;
  String? decricao;
  int? ativo;

  Grupo({
    this.grupoId,
    this.grupoIdInt,
    this.decricao,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'grupoId': grupoId,
      'grupoIdInt': grupoIdInt,
      'decricao': decricao,
      'ativo': ativo,
    };
  }

  factory Grupo.fromMap(Map<String, dynamic> mapaGrupo) {
    return Grupo(
      grupoId:
          mapaGrupo['grupoId'] != null ? mapaGrupo['grupoId'] as int : null,
      grupoIdInt:
          mapaGrupo['grupoIdInt'] != null
          ? mapaGrupo['grupoIdInt'] as String
          : null,
      decricao: mapaGrupo['decricao'] != null
          ? mapaGrupo['decricao'] as String
          : null,
      ativo: mapaGrupo['ativo'] != null ? mapaGrupo['ativo'] as int : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Grupo.fromJson(String source) => Grupo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Grupo(grupoId: $grupoId, grupoIdInt: $grupoIdInt, decricao: $decricao, ativo: $ativo)';
  }
}

//* criado em 22/08/2024

class Grupo {
  int? grupoId;
  String? grupoIdInt;
  String? descricao;
  int? ativo;

  Grupo({
    this.grupoId,
    this.grupoIdInt,
    this.descricao,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'grupoId': grupoId,
      'GrupoID_Int': grupoIdInt,
      'Descricao': descricao,
      'ativo': ativo,
    };
  }

  factory Grupo.fromMap(Map<String, dynamic> mapaGrupo) {
    return Grupo(
      grupoId:
          mapaGrupo['grupoId'] != null ? mapaGrupo['grupoId'] as int : null,
      grupoIdInt: mapaGrupo['GrupoID_Int'] != null
          ? mapaGrupo['GrupoID_Int'] as String
          : null,
      descricao: mapaGrupo['Descricao'] != null
          ? mapaGrupo['Descricao'] as String
          : null,
      ativo: mapaGrupo['ativo'] != null ? mapaGrupo['ativo'] as int : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Grupo.fromJson(String source) => Grupo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Grupo(grupoId: $grupoId, grupoIdInt: $grupoIdInt, descricao: $descricao, ativo: $ativo)';
  }
}

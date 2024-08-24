/*
24/08/2024
*/

class CatalogoTabela {
  int? catalogoTabelaId;
  int? tabelaId;
  double? fator;
  CatalogoTabela({
    this.catalogoTabelaId,
    this.tabelaId,
    this.fator,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'catalogoTabelaId': catalogoTabelaId,
      'tabelaId': tabelaId,
      'fator': fator,
    };
  }

  factory CatalogoTabela.fromMap(Map<String, dynamic> mapaCatalogoTabela) {
    return CatalogoTabela(
      catalogoTabelaId: mapaCatalogoTabela['catalogoTabelaId'] != null
          ? mapaCatalogoTabela['catalogoTabelaId'] as int
          : null,
      tabelaId: mapaCatalogoTabela['tabelaId'] != null
          ? mapaCatalogoTabela['tabelaId'] as int
          : null,
      fator: mapaCatalogoTabela['fator'] != null
          ? mapaCatalogoTabela['fator'] as double
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory CatalogoTabela.fromJson(String source) => CatalogoTabela.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CatalogoTabela(catalogoTabelaId: $catalogoTabelaId, tabelaId: $tabelaId, fator: $fator)';
}

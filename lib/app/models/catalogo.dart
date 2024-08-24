/*
24/08/2024
*/

class Catalogo {
  int? grupoId;
  int? corId;
  int? tamanhoId;
  int? tipoId;
  int? linhaId;
  int? materialId;
  double? precoMin;
  double? precoMax;
  int? precoEmGrama;
  double? pesoMin;
  double? pesoMax;
  int? lancamento;
  int? ordem;

  Catalogo({
    this.grupoId,
    this.corId,
    this.tamanhoId,
    this.tipoId,
    this.linhaId,
    this.materialId,
    this.precoMin,
    this.precoMax,
    this.precoEmGrama,
    this.pesoMin,
    this.pesoMax,
    this.lancamento,
    this.ordem,
  });

  Map<String, dynamic> toMap() {
    return {
      'grupoId': grupoId,
      'corId': corId,
      'tamanhoId': tamanhoId,
      'tipoId': tipoId,
      'linhaId': linhaId,
      'materialId': materialId,
      'precoMin': precoMin,
      'precoMax': precoMax,
      'precoEmGrama': precoEmGrama,
      'pesoMin': pesoMin,
      'pesoMax': pesoMax,
      'lancamento': lancamento,
      'ordem': ordem,
    };
  }

  factory Catalogo.fromMap(Map<String, dynamic> mapaCatalogo) {
    return Catalogo(
      grupoId: mapaCatalogo['grupoId'],
      corId: mapaCatalogo['corId'],
      tamanhoId: mapaCatalogo['tamanhoId'],
      tipoId: mapaCatalogo['tipoId'],
      linhaId: mapaCatalogo['linhaId'],
      materialId: mapaCatalogo['materialId'],
      precoMin: mapaCatalogo['precoMin'],
      precoMax: mapaCatalogo['precoMax'],
      precoEmGrama: mapaCatalogo['precoEmGrama'],
      pesoMin: mapaCatalogo['pesoMin'],
      pesoMax: mapaCatalogo['pesoMax'],
      lancamento: mapaCatalogo['lancamento'],
      ordem: mapaCatalogo['ordem'],
    );
  }
  // String toJson() => json.encode(toMap());

  // factory Catalogo.fromJson(String source) =>
  //     Catalogo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Catalogo(grupoId: $grupoId, corId: $corId, tamanhoId: $tamanhoId, tipoId: $tipoId, linhaId: $linhaId, materialId: $materialId, precoMin: $precoMin, precoMax: $precoMax, precoEmGrama: $precoEmGrama, pesoMin: $pesoMin, pesoMax: $pesoMax, lancamento: $lancamento, ordem: $ordem)';
  }
}

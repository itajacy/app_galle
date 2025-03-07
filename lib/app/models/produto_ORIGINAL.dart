//* criado em 23/08/2024

class Produto {
  int? produtoId;
  String? produtoIdInt;
  String? descricao;
  String? imagemId;
  int? grupoId;
  int? linhaId;
  int? materialId;
  int? corId;
  int? tamanhoId;
  int? tipoId;
  int? larguraMM;
  int? alturaMM;
  double? peso;
  int? ativo;
  int? lancamento;
  DateTime? lctoData;
  Produto({
    this.produtoId,
    this.produtoIdInt,
    this.descricao,
    this.imagemId,
    this.grupoId,
    this.linhaId,
    this.materialId,
    this.corId,
    this.tamanhoId,
    this.tipoId,
    this.larguraMM,
    this.alturaMM,
    this.peso,
    this.ativo,
    this.lancamento,
    this.lctoData,
  });
  //!  UTILIZACAO DE CAMPO COM DATA

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'produtoId': produtoId,
      'produtoIdInt': produtoIdInt,
      'descricao': descricao,
      'imagemId': imagemId,
      'grupoId': grupoId,
      'linhaId': linhaId,
      'materialId': materialId,
      'corId': corId,
      'tamanhoId': tamanhoId,
      'tipoId': tipoId,
      'larguraMM': larguraMM,
      'alturaMM': alturaMM,
      'peso': peso,
      'ativo': ativo,
      'lancamento': lancamento,
      'lctoData': lctoData?.millisecondsSinceEpoch,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> mapaProduto) {
    return Produto(
      produtoId: mapaProduto['produtoId'] != null
          ? mapaProduto['produtoId'] as int
          : null,
      produtoIdInt: mapaProduto['produtoIdInt'] != null
          ? mapaProduto['produtoIdInt'] as String
          : null,
      descricao: mapaProduto['descricao'] != null
          ? mapaProduto['descricao'] as String
          : null,
      imagemId: mapaProduto['imagemId'] != null
          ? mapaProduto['imagemId'] as String
          : null,
      grupoId:
          mapaProduto['grupoId'] != null ? mapaProduto['grupoId'] as int : null,
      linhaId:
          mapaProduto['linhaId'] != null ? mapaProduto['linhaId'] as int : null,
      materialId: mapaProduto['materialId'] != null
          ? mapaProduto['materialId'] as int
          : null,
      corId: mapaProduto['corId'] != null ? mapaProduto['corId'] as int : null,
      tamanhoId: mapaProduto['tamanhoId'] != null
          ? mapaProduto['tamanhoId'] as int
          : null,
      tipoId:
          mapaProduto['tipoId'] != null ? mapaProduto['tipoId'] as int : null,
      larguraMM: mapaProduto['larguraMM'] != null
          ? mapaProduto['larguraMM'] as int
          : null,
      alturaMM: mapaProduto['alturaMM'] != null
          ? mapaProduto['alturaMM'] as int
          : null,
      peso: mapaProduto['peso'] != null ? mapaProduto['peso'] as double : null,
      ativo: mapaProduto['ativo'] != null ? mapaProduto['ativo'] as int : null,
      lancamento: mapaProduto['lancamento'] != null
          ? mapaProduto['lancamento'] as int
          : null,
      lctoData: mapaProduto['lctoData'] != null
          ? DateTime.fromMillisecondsSinceEpoch(mapaProduto['lctoData'] as int)
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Produto.fromJson(String source) => Produto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Produto(produtoId: $produtoId, produtoIdInt: $produtoIdInt, descricao: $descricao, imagemId: $imagemId, grupoId: $grupoId, linhaId: $linhaId, materialId: $materialId, corId: $corId, tamanhoId: $tamanhoId, tipoId: $tipoId, larguraMM: $larguraMM, alturaMM: $alturaMM, peso: $peso, ativo: $ativo, lancamento: $lancamento, lctoData: $lctoData)';
  }
}

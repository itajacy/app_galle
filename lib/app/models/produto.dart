//* criado em 23/08/2024

class Produto {
  int? produtoId;
  String? produtoIdInt;
  String? descricao;
  String? imagemID;
  double? peso;
  String? grupoIdInt;
  String? linhaIdInt;
  String? materialIdInt;
  String? tamanhoIdInt;
  String? corIDInt;
  String? tipoIdInt;
  int? larguraMM;
  int? alturaMM;
  int? lancamento;
  int? lctoData;
  bool? ativo;
  Produto({
    this.produtoId,
    this.produtoIdInt,
    this.descricao,
    this.imagemID,
    this.peso,
    this.grupoIdInt,
    this.linhaIdInt,
    this.materialIdInt,
    this.tamanhoIdInt,
    this.corIDInt,
    this.tipoIdInt,
    this.larguraMM,
    this.alturaMM,
    this.lancamento,
    this.lctoData,
    this.ativo,
  });
  //!  UTILIZACAO DE CAMPO COM DATA

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'produtoId': produtoId,
      'ProdutoID_Int': produtoIdInt,
      'Descricao': descricao,
      'ImagemID': imagemID,
      'GrupoID_Int': grupoIdInt,
      'LinhaID_Int': linhaIdInt,
      'MaterialID_Int': materialIdInt,
      'CorID_Int': corIDInt,
      'TamanhoID_Int': tamanhoIdInt,
      'TipoID_Int': tipoIdInt,
      'Largura_MM': larguraMM,
      'Altura_MM': alturaMM,
      'peso': peso,
      'ativo': ativo,
      'Lancamento': lancamento,
      'LctoData': lctoData,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> mapaProduto) {
    return Produto(
      produtoId: mapaProduto['produtoId'] != null
          ? mapaProduto['produtoId'] as int
          : null,
      produtoIdInt: mapaProduto['ProdutoID_Int'] != null
          ? mapaProduto['ProdutoID_Int'] as String
          : null,
      descricao: mapaProduto['Descricao'] != null
          ? mapaProduto['Descricao'] as String
          : null,
      imagemID: mapaProduto['ImagemID'] != null
          ? mapaProduto['ImagemID'] as String
          : null,
      peso: mapaProduto['Peso'] != null
          ? double.parse(mapaProduto['Peso'])
          : null,
      grupoIdInt: mapaProduto['GrupoID_Int'] != null
          ? mapaProduto['GrupoID_Int'] as String
          : null,
      linhaIdInt: mapaProduto['LinhaID_Int'] != null
          ? mapaProduto['LinhaID_Int'] as String
          : null,
      materialIdInt: mapaProduto['MaterialID_Int'] != null
          ? mapaProduto['MaterialID_Int'] as String
          : null,
      corIDInt: mapaProduto['CorID_Int'] != null
          ? mapaProduto['CorID_Int'] as String
          : null,
      tamanhoIdInt: mapaProduto['TamanhoID_Int'] != null
          ? mapaProduto['TamanhoID_Int'] as String
          : null,
      tipoIdInt: mapaProduto['TipoID_Int'] != null
          ? mapaProduto['TipoID_Int'] as String
          : null,
      larguraMM: mapaProduto['Largura_MM'] != null
          ? int.parse(mapaProduto['Largura_MM']) 
          : null,
      alturaMM: mapaProduto['Altura_MM'] != null
          ? int.parse(mapaProduto['Altura_MM']) 
          : null,
      lancamento: mapaProduto['Lancamento'] != null
          ? int.parse(mapaProduto['Lancamento']) 
          : null,
      lctoData: mapaProduto['LctoData'] != null
          ? int.parse(mapaProduto['LctoData'])
          : null,
      ativo: mapaProduto['ativo'] != null ? mapaProduto['ativo'] as bool : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Produto.fromJson(String source) => Produto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Produto(produtoId: $produtoId, produtoIdInt: $produtoIdInt, descricao: $descricao, imagemID: $imagemID, grupoIdDInt: $grupoIdInt, linhaIdInt: $linhaIdInt, materialIdInt: $materialIdInt, corIDInt: $corIDInt, TamanhoID_Int: $tamanhoIdInt, TipoID_Int: $tipoIdInt, larguraMM: $larguraMM, alturaMM: $alturaMM, peso: $peso, ativo: $ativo, lancamento: $lancamento, lctoData: $lctoData)';
  }
}

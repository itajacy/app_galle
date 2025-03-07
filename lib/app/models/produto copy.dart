//* criado em 23/08/2024

class Produto {
  int? produtoId;
  String? produtoIdInt;
  String? descricao;
  String? imagemID;
  int? grupoIdInt;
  int? linhaIdInt;
  int? materialIdInt;
  int? corIDInt;
  int? tamanhoIdInt;
  int? tipoIdInt;
  int? larguraMM;
  int? alturaMM;
  double? peso;
  int? ativo;
  int? lancamento;
  int? lctoData;
  Produto({
    this.produtoId,
    this.produtoIdInt,
    this.descricao,
    this.imagemID,
    this.grupoIdInt,
    this.linhaIdInt,
    this.materialIdInt,
    this.corIDInt,
    this.tamanhoIdInt,
    this.tipoIdInt,
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
      'ProdutoID_Int': produtoIdInt,
      'Descricao': descricao,
      'ImagemID': imagemID,
      'GrupoID_Int': grupoIdInt,
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
      grupoIdInt: mapaProduto['GrupoID_Int'] != null
          ? mapaProduto['GrupoID_Int'] as int
          : null,
      linhaIdInt: mapaProduto['LinhaID_Int'] != null
          ? mapaProduto['LinhaID_Int'] as int
          : null,
      materialIdInt: mapaProduto['MaterialID_Int'] != null
          ? mapaProduto['MaterialID_Int'] as int
          : null,
      corIDInt: mapaProduto['CorID_Int'] != null
          ? mapaProduto['CorID_Int'] as int
          : null,
      tamanhoIdInt: mapaProduto['TamanhoID_Int'] != null
          ? mapaProduto['TamanhoID_Int'] as int
          : null,
      tipoIdInt: mapaProduto['TipoID_Int'] != null
          ? mapaProduto['TipoID_Int'] as int
          : null,
      larguraMM: mapaProduto['Largura_MM'] != null
          ? mapaProduto['Largura_MM'] as int
          : null,
      alturaMM: mapaProduto['Altura_MM'] != null
          ? mapaProduto['Altura_MM'] as int
          : null,
      peso: mapaProduto['peso'] != null ? mapaProduto['peso'] as double : null,
      ativo: mapaProduto['ativo'] != null ? mapaProduto['ativo'] as int : null,
      lancamento: mapaProduto['Lancamento'] != null
          ? mapaProduto['Lancamento'] as int
          : null,
      lctoData: mapaProduto['LctoData'] != null
          ? int.parse(mapaProduto['LctoData'])
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Produto.fromJson(String source) => Produto.fromMap(json.decode(source) as Map<String, dynamic>);
  @override
  String toString() {
    return 'Produto(produtoId: $produtoId, produtoIdInt: $produtoIdInt, descricao: $descricao, imagemID: $imagemID, grupoIdDInt: $grupoIdInt, linhaIdInt: $linhaIdInt, materialIdInt: $materialIdInt, corIDInt: $corIDInt, TamanhoID_Int: $tamanhoIdInt, TipoID_Int: $tipoIdInt, larguraMM: $larguraMM, alturaMM: $alturaMM, peso: $peso, ativo: $ativo, lancamento: $lancamento, lctoData: $lctoData)';
  }
}

class Cliente {
  int? clienteId;
  int? dispositivoId;
  int? clienteIdMob;
  String? clienteIdInt;
  String? razaoSocial;
  String? nomeFantasia;
  String? tipoPessoa;
  String? cNPJCPF;
  String? iERG;
  String? contato;
  String? fone1;
  String? fone2;
  String? foneRes;
  String? fax;
  String? email;
  String? pCidade;
  String? pUF;
  String? pEndereco;
  String? pComplemento;
  String? pBairro;
  String? pCEP;
  String? eCidade;
  String? eUF;
  String? eEndereco;
  String? eComplemento;
  String? eBairro;
  String? eCEP;
  int? ativo;

  Cliente({
    this.clienteId,
    this.dispositivoId,
    this.clienteIdMob,
    this.clienteIdInt,
    this.razaoSocial,
    this.nomeFantasia,
    this.tipoPessoa,
    this.cNPJCPF,
    this.iERG,
    this.contato,
    this.fone1,
    this.fone2,
    this.foneRes,
    this.fax,
    this.email,
    this.pCidade,
    this.pUF,
    this.pEndereco,
    this.pComplemento,
    this.pBairro,
    this.pCEP,
    this.eCidade,
    this.eUF,
    this.eEndereco,
    this.eComplemento,
    this.eBairro,
    this.eCEP,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return {
      'clienteId': clienteId,
      'dispositivoId': dispositivoId,
      'clienteIdMob': clienteIdMob,
      'clienteIdInt': clienteIdInt,
      'razaoSocial': razaoSocial,
      'nomeFantasia': nomeFantasia,
      'tipoPessoa': tipoPessoa,
      'cNPJCPF': cNPJCPF,
      'iERG': iERG,
      'contato': contato,
      'fone1': fone1,
      'fone2': fone2,
      'foneRes': foneRes,
      'fax': fax,
      'email': email,
      'pCidade': pCidade,
      'pUF': pUF,
      'pEndereco': pEndereco,
      'pComplemento': pComplemento,
      'pBairro': pBairro,
      'pCEP': pCEP,
      'eCidade': eCidade,
      'eUF': eUF,
      'eEndereco': eEndereco,
      'eComplemento': eComplemento,
      'eBairro': eBairro,
      'eCEP': eCEP,
      'ativo': ativo,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> mapaCliente) {
    return Cliente(
      clienteId: mapaCliente['clienteId'] as int,
      dispositivoId: mapaCliente['dispositivoId'] as int,
      clienteIdMob: mapaCliente['clienteIdMob'] as int,
      clienteIdInt: mapaCliente['clienteIdInt'],
      razaoSocial: mapaCliente['razaoSocial'],
      nomeFantasia: mapaCliente['nomeFantasia'],
      tipoPessoa: mapaCliente['tipoPessoa'],
      cNPJCPF: mapaCliente['cNPJCPF'],
      iERG: mapaCliente['iERG'],
      contato: mapaCliente['contato'],
      fone1: mapaCliente['fone1'],
      fone2: mapaCliente['fone2'],
      foneRes: mapaCliente['foneRes'],
      fax: mapaCliente['fax'],
      email: mapaCliente['email'],
      pCidade: mapaCliente['pCidade'],
      pUF: mapaCliente['pUF'],
      pEndereco: mapaCliente['pEndereco'],
      pComplemento: mapaCliente['pComplemento'],
      pBairro: mapaCliente['pBairro'],
      pCEP: mapaCliente['pCEP'],
      eCidade: mapaCliente['eCidade'],
      eUF: mapaCliente['eUF'],
      eEndereco: mapaCliente['eEndereco'],
      eComplemento: mapaCliente['eComplemento'],
      eBairro: mapaCliente['eBairro'],
      eCEP: mapaCliente['eCEP'],
      ativo: mapaCliente['ativo'] as int,
    );
  }
}

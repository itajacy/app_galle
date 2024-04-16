class Cliente {
  final int clienteId;
  final int dispositivoId;
  final int clienteIdMob;
  final String clienteIdInt;
  final String razaoSocial;
  final String nomeFantasia;
  final String tipoPessoa;
  final String cNPJCPF;
  final String iERG;
  final String contato;
  final String fone1;
  final String fone2;
  final String foneRes;
  final String fax;
  final String email;
  final String pCidade;
  final String pUF;
  final String pEndereco;
  final String pComplemento;
  final String pBairro;
  final String pCEP;
  final String eCidade;
  final String eUF;
  final String eEndereco;
  final String eComplemento;
  final String eBairro;
  final String eCEP;
  final int ativo;

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

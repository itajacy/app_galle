//* criado em 21/08/2024

import 'dart:convert';

class Cliente {
  int? clienteId;
  String? dispositivoId;
  String? clienteIdMob;
  String? clienteIdInt;
  String? razaoSocial;
  String? nomeFantasia;
  String? tipoPessoa;
  String? cNPJCPF;
  String? iERG;
  String? contato;
  String? fone1;
  String? fone2;
  String? foneCel;
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
  String? ativo;

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
    this.foneCel,
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
      'foneCel': foneCel,
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

  // Map<String, dynamic> toMapFtp() {
  //   return {
  //     'clienteId': clienteId,
  //     'DispositivoID': dispositivoId,
  //     'ClienteID_Mob': clienteIdMob,
  //     'ClienteID_Int': clienteIdInt,
  //     'RazaoSocial': razaoSocial,
  //     'NomeFantasia': nomeFantasia,
  //     'TipoPessoa': tipoPessoa,
  //     'CGCCPF': cNPJCPF,
  //     'IERG': iERG,
  //     'Contato': contato,
  //     'FoneCom1': fone1,
  //     'FoneCom2': fone2,
  //     'FoneCel': foneCel,
  //     'FoneRes': foneRes,
  //     'FoneFax': fax,
  //     'Email': email,
  //     'S_Cidade': pCidade,
  //     'S_UF': pUF,
  //     'S_Endereco': pEndereco,
  //     'S_Complemento': pComplemento,
  //     'S_Bairro': pBairro,
  //     'S_CEP': pCEP,
  //     'E_Cidade': eCidade,
  //     'E_UF': eUF,
  //     'E_Endereco': eEndereco,
  //     'E_Complemento': eComplemento,
  //     'E_Bairro': eBairro,
  //     'E_CEP': eCEP,
  //     'ativo': ativo,
  //   };
  // }

  factory Cliente.fromMap(Map<String, dynamic> mapaCliente) {
    return Cliente(
      // clienteId: mapaCliente['clienteId'] as int,
      clienteIdInt: mapaCliente['clienteIdInt'] ?? '',
      dispositivoId: mapaCliente['dispositivoId'] ?? '',
      clienteIdMob: mapaCliente['clienteIdMob'] ?? '',
      razaoSocial: mapaCliente['razaoSocial'] ?? '',
      nomeFantasia: mapaCliente['nomeFantasia'] ?? '',
      tipoPessoa: mapaCliente['tipoPessoa'] ?? '',
      cNPJCPF: mapaCliente['cNPJCPF'] ?? '',
      iERG: mapaCliente['iERG'] ?? '',
      contato: mapaCliente['contato'] ?? '',
      fone1: mapaCliente['fone1'] ?? '',
      fone2: mapaCliente['fone2'] ?? '',
      foneCel: mapaCliente['foneCel'] ?? '',
      foneRes: mapaCliente['foneRes'] ?? '',
      fax: mapaCliente['fax'] ?? '',
      email: mapaCliente['email'] ?? '',
      pCidade: mapaCliente['pCidade'] ?? '',
      pUF: mapaCliente['pUF'] ?? '',
      pEndereco: mapaCliente['pEndereco'] ?? '',
      pComplemento: mapaCliente['pComplemento'] ?? '',
      pBairro: mapaCliente['pBairro'] ?? '',
      pCEP: mapaCliente['pCEP'] ?? '',
      eCidade: mapaCliente['eCidade'] ?? '',
      eUF: mapaCliente['eUF'] ?? '',
      eEndereco: mapaCliente['eEndereco'] ?? '',
      eComplemento: mapaCliente['eComplemento'] ?? '',
      eBairro: mapaCliente['eBairro'] ?? '',
      eCEP: mapaCliente['eCEP'] ?? '',
      ativo: mapaCliente['ativo'] ?? '',
    );
  }

  //! O metodo abaixo foi criado pq os nomes das chaves do Map importado do
  //! arquivo Cliente.xml são diferentes do padrão
  factory Cliente.fromMapFtp(Map<String, dynamic> mapaCliente) {
    return Cliente(
      // clienteId: mapaCliente['ClienteID_Int'] as int,
      clienteIdInt: mapaCliente['ClienteID_Int'] ?? '',
      dispositivoId: mapaCliente['DispositivoID'] ?? '',
      clienteIdMob: mapaCliente['ClienteID_Mob'] ?? '',
      razaoSocial: mapaCliente['RazaoSocial'] ?? '',
      nomeFantasia: mapaCliente['NomeFantasia'] ?? '',
      tipoPessoa: mapaCliente['TipoPessoa'] ?? '',
      cNPJCPF: mapaCliente['CGCCPF'] ?? '',
      iERG: mapaCliente['IERG'] ?? '',
      contato: mapaCliente['Contato'] ?? '',
      fone1: mapaCliente['FoneCom1'] ?? '',
      fone2: mapaCliente['FoneCom2'] ?? '',
      foneCel: mapaCliente['FoneCel'] ?? '',
      foneRes: mapaCliente['FoneRes'] ?? '',
      fax: mapaCliente['FoneFax'] ?? '',
      email: mapaCliente['Email'] ?? '',
      pCidade: mapaCliente['S_Cidade'] ?? '',
      pUF: mapaCliente['S_UF'] ?? '',
      pEndereco: mapaCliente['S_Endereco'] ?? '',
      pComplemento: mapaCliente['S_Complemento'] ?? '',
      pBairro: mapaCliente['S_Bairro'] ?? '',
      pCEP: mapaCliente['S_CEP'] ?? '',
      eCidade: mapaCliente['E_Cidade'] ?? '',
      eUF: mapaCliente['E_UF'] ?? '',
      eEndereco: mapaCliente['E_Endereco'] ?? '',
      eComplemento: mapaCliente['E_Complemento'] ?? '',
      eBairro: mapaCliente['E_Bairro'] ?? '',
      eCEP: mapaCliente['E_CEP'] ?? '',
      ativo: mapaCliente['ativo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Cliente.fromJson(String source) =>
      Cliente.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cliente(clienteId: $clienteId, dispositivoId: $dispositivoId, clienteIdMob: $clienteIdMob, clienteIdInt: $clienteIdInt, razaoSocial: $razaoSocial, nomeFantasia: $nomeFantasia, tipoPessoa: $tipoPessoa, cNPJCPF: $cNPJCPF, iERG: $iERG, contato: $contato, fone1: $fone1, fone2: $fone2, foneCel: $foneCel, foneRes: $foneRes, fax: $fax, email: $email, pCidade: $pCidade, pUF: $pUF, pEndereco: $pEndereco, pComplemento: $pComplemento, pBairro: $pBairro, pCEP: $pCEP, eCidade: $eCidade, eUF: $eUF, eEndereco: $eEndereco, eComplemento: $eComplemento, eBairro: $eBairro, eCEP: $eCEP, ativo: $ativo)';
  }
}

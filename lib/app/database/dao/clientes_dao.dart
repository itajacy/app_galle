class ClientesDao {
  static const String tabelaClientes = 'CREATE TABLE $_tableName('
      '$_clienteId INTEGER PRIMARY KEY, '
      '$_dispositivoId TEXT, '
      '$_clienteIdMob TEXT, '
      '$_clienteIdInt TEXT, '
      '$_razaoSocial TEXT, '
      '$_nomeFantasia TEXT, '
      '$_tipoPessoa TEXT, '
      '$_cNPJCPF TEXT, '
      '$_iERG TEXT, '
      '$_contato TEXT, '
      '$_fone1 TEXT, '
      '$_fone2 TEXT, '
      '$_foneRes TEXT, '
      '$_fax TEXT, '
      '$_email TEXT, '
      '$_pCidade TEXT, '
      '$_pUF TEXT, '
      '$_pEndereco TEXT, '
      '$_pComplemento TEXT, '
      '$_pBairro TEXT, '
      '$_pCEP TEXT, '
      '$_eCidade TEXT, '
      '$_eUF TEXT, '
      '$_eEndereco TEXT, '
      '$_eComplemento TEXT, '
      '$_eBairro TEXT, '
      '$_eCEP TEXT, '
      '$_ativo TEXT)';

  static const String _tableName = 'tabClientes';

  static const String _clienteId = 'clienteId';
  static const String _dispositivoId = 'dispositivoId';
  static const String _clienteIdMob = 'clienteIdMob';
  static const String _clienteIdInt = 'clienteIdInt';
  static const String _razaoSocial = 'razaoSocial';
  static const String _nomeFantasia = 'nomeFantasia';
  static const String _tipoPessoa = 'tipoPessoa';
  static const String _cNPJCPF = 'cNPJCPF';
  static const String _iERG = 'iERG';
  static const String _contato = 'contato';
  static const String _fone1 = 'fone1';
  static const String _fone2 = 'fone2';
  static const String _foneRes = 'foneRes';
  static const String _fax = 'fax';
  static const String _email = 'email';
  static const String _pCidade = 'pCidade';
  static const String _pUF = 'pUF';
  static const String _pEndereco = 'pEndereco';
  static const String _pComplemento = 'pComplemento';
  static const String _pBairro = 'pBairro';
  static const String _pCEP = 'pCEP';
  static const String _eCidade = 'eCidade';
  static const String _eUF = 'eUF';
  static const String _eEndereco = 'eEndereco';
  static const String _eComplemento = 'eComplemento';
  static const String _eBairro = 'eBairro';
  static const String _eCEP = 'eCEP';
  static const String _ativo = 'ativo';

  // toMap()

  Map<String, dynamic> toMap() {
    return {};
  }
}

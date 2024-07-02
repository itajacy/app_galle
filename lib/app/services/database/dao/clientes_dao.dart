import 'package:galle/app/services/database/app_database.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/cliente.dart';

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
      '$_foneCel TEXT, '
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

  static const String _tableName = 'clientes';
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
  static const String _foneCel = 'foneCel';
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

  Future<int> salvar(Cliente cliente) async {
    final Database db = await getDatabase();
    Map<String, dynamic> clienteMap = cliente.toMap();

    return db.insert(_tableName, clienteMap);
  }

  Future<List<Cliente>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    // final List<Map> result = await db.rawQuery("SELECT * FROM $_tableName");
    print("result é do tipo==> ${result.runtimeType}");
    final List<Cliente> listaDeClientes = [];
    print("clientes no findAll");
    print(result.length);

    for (var cliente in result) {
      listaDeClientes.add(Cliente.fromMap(cliente));
    }

    // result.forEach((v) => listaDeClientes.add(Cliente.fromMap(v)));
    return listaDeClientes;
  }
}




    // print(testecliente.clienteId);
    // print(testecliente.dispositivoId);
    // print(testecliente.clienteIdMob);
    // print(testecliente.clienteIdInt);
    // print(testecliente.nomeFantasia);
    // print(testecliente.razaoSocial);
    // print(testecliente.tipoPessoa);
    // print(testecliente.cNPJCPF);
    // print(testecliente.iERG);
    // print(testecliente.contato);
    // print(testecliente.email);
    // print(testecliente.fone1);
    // print(testecliente.fone2);
    // print(testecliente.foneCel);
    // print(testecliente.foneRes);
    // print(testecliente.fax);
    // print(testecliente.pUF);
    // print(testecliente.pCidade);
    // print(testecliente.pEndereco);
    // print(testecliente.pComplemento);
    // print(testecliente.pBairro);
    // print(testecliente.pCEP);
    // print(testecliente.eUF);
    // print(testecliente.eCidade);
    // print(testecliente.eEndereco);
    // print(testecliente.eComplemento);
    // print(testecliente.eBairro);
    // print(testecliente.eCEP);













  // final List<Map<String, dynamic>> result = await db.query(
//       _tableName,
//       where: 'funcaoColaborador = ?',
//       whereArgs: [funcao],
//     );

// final List<Map<String, dynamic>> result = await db.query(_tableName);
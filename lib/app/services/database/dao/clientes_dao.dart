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

  // Future<int> salvarMap(Map<String, dynamic> mapaCliente) async {
  //   final Database db = await getDatabase();
  //   return db.insert(_tableName, mapaCliente);
  // }

  Future<List<Cliente>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    // final List<Map> result = await db.rawQuery("SELECT * FROM $_tableName");
    final List<Cliente> listaDeClientes = [];
    for (var cliente in result) {
      listaDeClientes.add(Cliente.fromMap(cliente));
    }
    // result.forEach((v) => listaDeClientes.add(Cliente.fromMap(v)));

    return listaDeClientes;
  }

  Future<List<Cliente>> findClientes(String cliente) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'nomeFantasia LIKE ? OR razaoSocial LIKE ? OR clienteIdInt LIKE ?',
      whereArgs: ['%$cliente%', '%$cliente%', '%$cliente%'],
    );
    final List<Cliente> listaDeClientes = [];
    for (var cliente in result) {
      listaDeClientes.add(Cliente.fromMap(cliente));
    }

    return listaDeClientes;
  }

  Future<int> alterar(Cliente cliente) async {
    print('ClienteId do alterar--> ${cliente.clienteId}');
    final Database db = await getDatabase();
    final Map<String, dynamic> clienteMap = cliente.toMap();
    return db.update(
      _tableName,
      clienteMap,
      where: 'clienteId = ?',
      whereArgs: [cliente.clienteId],
    );
  }

  Future<int> excluir(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: 'clienteId = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    try {
      final Database db = await getDatabase();
      return db.delete(_tableName);
    } catch (e) {
      print('Erro ao excluir todos os registros: $e');
      return -1; // Retorna -1 em caso de erro
    }
  }
}

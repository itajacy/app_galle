/*
22/08/2024
*/

import 'package:sqflite/sqflite.dart';

import '../../../models/material_do_produto.dart';
import '../app_database.dart';

class MaterialDao {
  static const String tabelaMaterial = 'CREATE TABLE $_tableName ('
      '$_materialId INTEGER PRIMARY KEY, '
      '$_materialIdInt TEXT, '
      '$_descricao TEXT, '
      '$_ativo INTEGER)';

  static const String _tableName = 'material';
  static const String _materialId = 'materialId';
  static const String _materialIdInt = 'MaterialID_Int';
  static const String _descricao = 'Descricao';
  static const String _ativo = 'ativo';

  Future<int> salvar(MaterialDoProduto material) async {
    final Database db = await getDatabase();
    Map<String, dynamic> materialMap = material.toMap();
    print('-----');
    print(materialMap.toString());
    print('-----');

    return db.insert(_tableName, materialMap);
  }

  Future<int> deleteAll() async {
    try {
      final Database db = await getDatabase();
      return db.delete(_tableName);
    } catch (e) {
      print('Erro ao excluir todos os registros da material $_tableName: $e');
      return -1; // Retorna -1 em caso de erro
    }
  }

  Future<List<MaterialDoProduto>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<MaterialDoProduto> listaDeMateriais = [];
    for (var material in result) {
      listaDeMateriais.add(MaterialDoProduto.fromMap(material));
    }
    return listaDeMateriais;
  }

  Future<List<MaterialDoProduto>> findMateriais(
      String descricaoDoMaterialDoProduto) async {
    print(
        'findMateriais em MaterialDoProduto_dao--> $descricaoDoMaterialDoProduto');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'Descricao LIKE ?',
      whereArgs: [
        '%$descricaoDoMaterialDoProduto%',
      ],
    );
    final List<MaterialDoProduto> listaDeMateriais = [];
    for (var material in result) {
      listaDeMateriais.add(MaterialDoProduto.fromMap(material));
    }
    print('---inicio da lista de grupos findMateriais---');
    print(listaDeMateriais.toString());
    print('---fim da lista de Materiais findMateriais---');

    return listaDeMateriais;
  }
}

/*
22/08/2024
*/

import 'package:sqflite/sqflite.dart';

import '../../../models/imagem.dart';
import '../app_database.dart';

class ImagemDao {
  static const String tabelaImagem = 'CREATE TABLE $_tableName ('
      '$_imagemId TEXT PRIMARY KEY, '
      '$_timeStamp INTEGER)';

  static const String _tableName = 'imagem';
  static const String _imagemId = 'ImagemID';
  static const String _timeStamp = 'Timestamp';


  //-

  Future<int> salvar(Imagem imagem) async {
    final Database db = await getDatabase();
    Map<String, dynamic> imagemMap = imagem.toMap();
    print('-----');
    print(imagemMap.toString());
    print('-----');

    return db.insert(_tableName, imagemMap);
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

  Future<List<Imagem>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Imagem> listaDeImagens = [];
    for (var imagem in result) {
      listaDeImagens.add(Imagem.fromMap(imagem));
    }
    return listaDeImagens;
  }

  Future<List<Imagem>> findImagens(String descricaoDaImagem) async {
    print('findImagens em imagens_dao--> $descricaoDaImagem');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: 'Descricao LIKE ?',
      whereArgs: [
        '%$descricaoDaImagem%',
      ],
    );
    final List<Imagem> listaDeImagens = [];
    for (var item in result) {
      listaDeImagens.add(Imagem.fromMap(item));
    }
    print('---inicio da lista de imagemes findImagens---');
    print(listaDeImagens.toString());
    print('---fim da lista de Imagens findImagens---');

    return listaDeImagens;
  }
}

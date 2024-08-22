/*
22/08/2024
*/

class ImagemDao {
  static const String tabelaImagem = 'CREATE TABLE $_tableName ('
      '$_imagemId TEXT, '
      '$_timeStamp INTEGER)';

  static const String _tableName = 'imagem';
  static const String _imagemId = 'imagemId';
  static const String _timeStamp = 'timeStamp';
}

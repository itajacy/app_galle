/* 
Data: 20/08/2024
*/
class DispositivoDao {
  static const String tabelaDispositivo = 'CREATE TABLE $_tableName('
      '$_dispositivoId INTEGER, '
      '$_address TEXT, '
      '$_urlImagens TEXT, '
      '$_representanteIdInt TEXT, '
      '$_email TEXT)';

  static const String _tableName = 'dispositivo';
  static const String _dispositivoId = 'dispositivoId';
  static const String _address = 'address';
  static const String _urlImagens = 'urlIimagens';
  static const String _representanteIdInt = 'representanteIdInt';
  static const String _email = 'email';
}

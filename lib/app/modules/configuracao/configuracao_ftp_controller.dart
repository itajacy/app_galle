import 'package:ftpconnect/ftpconnect.dart';

class ConfiguracaoFtpController {
  bool? conectado;
  String mensagem = '';

  testeConexaoFTP(String endereco, String usuario, String senha) async {
    FTPConnect ftpConnect = FTPConnect(endereco, user: usuario, pass: senha);
    // String fileName = 'arq.zip';
    // var getPathFile = DirectoryPath();
    // var storePath = await getPathFile.getPath();
    // String filePath = '$storePath/$fileName';

    // var arquivo = File(filePath);
    // print('arquivo--> $arquivo');
    try {
      // Conectando ao servidor
      conectado = await ftpConnect.connect();

      // Obtendo o tamanho do arquivo remoto
      // int fileSize = await ftpConnect.sizeFile(fileName);
      // print('Tamanho do arquivo no FTP: $fileSize bytes');

      // Garantindo que o arquivo esteja vazio antes do download
      // if (arquivo.existsSync()) {
      //   print('apagando arquivo--> $arquivo');
      //   print("arq.zip existe..> ${arquivo.existsSync()}");
      //   arquivo.deleteSync();
      //   print("arq.zip existe..> ${arquivo.existsSync()}");
      //   print('arquivo apagado!!!');
      // }
      // arquivo.createSync();

      // Baixando o arquivo diretamente para o armazenamento
      // await ftpConnect.downloadFileWithRetry(
      //   fileName,
      //   arquivo,
      //   pRetryCount: 2,
      //   onProgress: (progressInPercent, totalReceived, fileSize) {
      //     // Atualizando o progresso do download
      //     setState(() {
      //       _downloadProgress = progressInPercent / 100;
      //       conectado;
      //     });
      //     print('Progresso: ${progressInPercent.toStringAsFixed(2)}%');
      //     print('Total recebido: $totalReceived de $fileSize bytes');
      //   },
      // );

      // print('Download concluído com sucesso!');

      // Verificando o tamanho do arquivo baixado
      // int localFileSize = arquivo.lengthSync();
      // print('Tamanho do arquivo baixado: $localFileSize bytes');

      // if (localFileSize != fileSize) {
      //   print('Erro: O arquivo baixado tem um tamanho diferente do original.');
      // }

      mensagem = 'CONECTADO COM SUCESSO';
      print(mensagem);

      // Desconectando do servidor
      await ftpConnect.disconnect();
    } catch (e) {
      //! FTPConnectException: Wrong Username/password (Response: 530 User or password not found)
      conectado = false;
      if (e.toString().contains('530')) {
        mensagem = 'Usuário e/ou Senha inválido(s)';
      } else {
        mensagem = 'Falha ao conectar:  ${e.toString()}';
      }
      print(mensagem);
      mensagem;
      // print('Erro: $e');
    }
  }
}

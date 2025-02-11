import 'dart:io';

import 'package:ftpconnect/ftpconnect.dart';

import '../modules/configuracao/widgets/directory_path.dart';

class ConnectFtp {
  // List<String> listaDeArquivos = [
  //   'Cliente',
  //   'Cor',
  //   'Grupo',
  //   'Dispositivo',
  //   'Imagem',
  //   'Linha',
  //   'Material',
  //   'Preco',
  //   'Produto',
  //   'Tabela',
  //   'Tamanho',
  //   'Tipo',
  // ];

  conexaoFTP(String nomeDoArquivoXml) async {
    print('conexaoFTP');
    // TODO LER OS DADOS DE URLADDRESS, USUARIO E SENHA DO arquivo de Dispositivo e colocar aqui
    FTPConnect ftpConnect = FTPConnect('191.252.83.183',
        user: 'palm03@galle', pass: 'Jequitiba1602!');
        
    String fileName = '$nomeDoArquivoXml.xml';
    var getPathFile = DirectoryPath();
    var storePath = await getPathFile.getPath();
    String filePath = '$storePath/$fileName';

    var arquivo = File(filePath);
    print('arquivo--> $arquivo');
    try {
      // Conectando ao servidor
      await ftpConnect.connect();

      // Obtendo o tamanho do arquivo remoto
      int fileSize = await ftpConnect.sizeFile(fileName);
      print('Tamanho do arquivo $nomeDoArquivoXml no FTP: $fileSize bytes');

      // Garantindo que o arquivo esteja vazio antes do download
      if (arquivo.existsSync()) {
        print("$fileName existe..> ${arquivo.existsSync()}");
        print('apagando arquivo--> $arquivo');
        arquivo.deleteSync();
        print("$fileName existe..> ${arquivo.existsSync()}");
        print('arquivo $fileName apagado!!!');
      }
      arquivo.createSync();

      // Baixando o arquivo diretamente para o armazenamento
      await ftpConnect.downloadFileWithRetry(
        fileName,
        arquivo,
        pRetryCount: 2,
        onProgress: (progressInPercent, totalReceived, fileSize) {
          // Atualizando o progresso do download
          // setState(() {
          //   _downloadProgress = progressInPercent / 100;
          // });
          // print('Progresso: ${progressInPercent.toStringAsFixed(2)}%');
          // print('Total recebido: $totalReceived de $fileSize bytes');
        },
      );

      print('Download concluído do arquivo $nomeDoArquivoXml com sucesso!');

      // Verificando o tamanho do arquivo baixado
      int localFileSize = arquivo.lengthSync();
      print('Tamanho do arquivo baixado: $localFileSize bytes');

      if (localFileSize != fileSize) {
        print(
            '1- Erro: O arquivo $nomeDoArquivoXml tem um tamanho diferente do original.');
        print(
            '2- tamanho do arquivo baixado: $localFileSize, tamanho do arquivo original: $fileSize');
      }

      // Desconectando do servidor
      await ftpConnect.disconnect();
    } catch (e) {
      print('Erro durante o download: $e');
    }
  }
}

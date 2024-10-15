import 'dart:io';

import 'package:ftpconnect/ftpconnect.dart';

import '../../models/cliente.dart';
import '../../services/database/dao/clientes_dao.dart';
import '../configuracao/widgets/directory_path.dart';

class SincronizacaoController {
  ClientesDao clientesDao = ClientesDao();
  int resposta = 0;

  Future<int> salvarOuAlterarClientes(Cliente cliente) async {
    List resp = await clientesDao.findClientes(cliente.cNPJCPF!);
    print('lista de clientes do salvarOuAlterarClientes--> $resp');
    print('cliente.cNPJCPF--> ${cliente.cNPJCPF}');
    print(
        'valor de resp (se ==0 -> altera, se != 0-> inclui)--> ${resp.length}');
    if (resp.length != 0) {
      //se a lista  NAO for vazia, ALTERA o cliente, pq ele não  JA existe na tabela
      // resposta = 0;
      if (cliente.cNPJCPF != "NAO TEM") {
        resposta = await clientesDao.alterarFtp(cliente); //! teste veja arquivo
        //! resposta = await clientesDao.alterar(cliente);
      }
      print('resposta--> $resposta');
      print('ClienteId  alterado--> ${cliente.clienteId}');
    } else {
      //se a lista for vazia salva o cliente, pq ele não existe na tabela
      resposta = await clientesDao.salvar(cliente);
      print('resposta--> $resposta');
      print('ClienteId  novo--> ${cliente.clienteId}');
    }
    print('----------------============================---------------');
    return resposta;
  }

  Future<int> salvarCliente(Cliente cliente) async {
    int resultado = await clientesDao.salvar(cliente);
    return resultado;
  }

  Future<int> apagaTodosOsClientes() async {
    int resultado = await clientesDao.deleteAll();
    return resultado;
  }

  conexaoFTP() async {
    FTPConnect ftpConnect = FTPConnect('191.252.83.183',
        user: 'palm03@galle', pass: 'Jequitiba1602!');
    String fileName = 'Cliente.xml';
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
      print('Tamanho do arquivo no FTP: $fileSize bytes');

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

      print('Download concluído com sucesso!');

      // Verificando o tamanho do arquivo baixado
      int localFileSize = arquivo.lengthSync();
      print('Tamanho do arquivo baixado: $localFileSize bytes');

      if (localFileSize != fileSize) {
        print('Erro: O arquivo baixado tem um tamanho diferente do original.');
      }

      // Desconectando do servidor
      await ftpConnect.disconnect();
    } catch (e) {
      print('Erro durante o download: $e');
    }
  }
}

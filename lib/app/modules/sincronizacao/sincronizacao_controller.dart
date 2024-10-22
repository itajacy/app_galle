import 'dart:io';

import 'package:ftpconnect/ftpconnect.dart';

import '../../models/cliente.dart';
import '../../services/database/dao/clientes_dao.dart';
import '../configuracao/widgets/directory_path.dart';

class SincronizacaoController {
  ClientesDao clientesDao = ClientesDao();
  int resposta = 0;

  Future<int> salvarOuAlterarClientes(Cliente clienteDoXml) async {
    List<Cliente> respostaFindClientes =
        await clientesDao.findClientes(clienteDoXml.cNPJCPF!);
    print(
        'lista de clientes do salvarOuAlterarClientes--> $respostaFindClientes');
    print('cliente.cNPJCPF--> ${clienteDoXml.cNPJCPF}');
    print(
        'valor de respostaFindClientes (se ==0 -> INCLUI, se != 0-> ALTERA)--> ${respostaFindClientes.length}');
    if (respostaFindClientes.length != 0) {
      //se a lista  NAO for vazia, ALTERA o cliente, pq ele não  JA existe na tabela
      // resposta = 0;
      print(
          '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--respostaFindClientes clienteIdInt-- ${respostaFindClientes.elementAt(0).clienteIdInt}');
      if (clienteDoXml.cNPJCPF != "NAO TEM") {
        print('---- INICIO ALTERANDO CLIENTE-----');
        print('id--> ${clienteDoXml.clienteId}');
        print('Razao--> ${clienteDoXml.razaoSocial}');
        print('N.Fantasia--> ${clienteDoXml.nomeFantasia}');
        // clienteDoXml.clienteIdInt = respostaFindClientes.elementAt(0).clienteIdInt;
        Cliente clienteAlterado = Cliente();
        clienteAlterado.clienteId = respostaFindClientes.elementAt(0).clienteId;
        clienteAlterado.dispositivoId = clienteDoXml.dispositivoId;

        clienteAlterado.clienteIdInt = clienteDoXml.clienteIdInt;
        clienteAlterado.clienteIdMob = clienteDoXml.clienteIdMob;
        clienteAlterado.razaoSocial = clienteDoXml.razaoSocial;
        clienteAlterado.nomeFantasia = clienteDoXml.nomeFantasia;
        clienteAlterado.tipoPessoa = clienteDoXml.tipoPessoa;
        clienteAlterado.cNPJCPF = clienteDoXml.cNPJCPF;
        clienteAlterado.iERG = clienteDoXml.iERG;
        clienteAlterado.contato = clienteDoXml.contato;
        clienteAlterado.fone1 = clienteDoXml.fone1;
        clienteAlterado.fone2 = clienteDoXml.fone2;
        clienteAlterado.foneCel = clienteDoXml.foneCel;
        clienteAlterado.foneRes = clienteDoXml.foneRes;
        clienteAlterado.fax = clienteDoXml.fax;
        clienteAlterado.email = clienteDoXml.email;
        clienteAlterado.pCidade = clienteDoXml.pCidade;
        clienteAlterado.pUF = clienteDoXml.pUF;
        clienteAlterado.pEndereco = clienteDoXml.pEndereco;
        clienteAlterado.pComplemento = clienteDoXml.pComplemento;
        clienteAlterado.pBairro = clienteDoXml.pBairro;
        clienteAlterado.pCEP = clienteDoXml.pCEP;
        clienteAlterado.eCidade = clienteDoXml.eCidade;
        clienteAlterado.eUF = clienteDoXml.eUF;
        clienteAlterado.eEndereco = clienteDoXml.eEndereco;
        clienteAlterado.eComplemento = clienteDoXml.eComplemento;
        clienteAlterado.eBairro = clienteDoXml.eBairro;
        clienteAlterado.eCEP = clienteDoXml.eCEP;
        clienteAlterado.ativo = clienteDoXml.ativo;

        resposta =
            await clientesDao.alterar(clienteAlterado); //! teste veja arquivo
        print('---- FIM ALTERANDO CLIENTE-----');
        //! resposta = await clientesDao.alterar(cliente);
      }
      print('resposta--> $resposta');
      // print('ClienteId  alterado--> ${clienteAlterado.clienteId}');
    } else {
      //se a lista for vazia salva o cliente, pq ele não existe na tabela
      resposta = await clientesDao.salvar(clienteDoXml);
      print('resposta--> $resposta');
      print('ClienteId  novo--> ${clienteDoXml.clienteId}');
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

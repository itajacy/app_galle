//* alterado em 24/09/24

// //! Para acessar o ftp --> ftpconnect
// //! Para conseguir baixar o arquivo e gravá-lo no dispositivo --> veja permission_handler
// //! Param conseguir gravar o arquivo no dispositivo --> veja open_file_plus
// //! Encontra locais comumente usados no sistema de arquivos --> path_provider

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:galle/app/modules/configuracao/configuracao_ftp_controller.dart';
import 'package:get/get.dart';
import '../../core/colors_app.dart';
import '../../core/font.dart';
import '../../core/sizes.dart';
import '../../core/space.dart';
import '../../core/strings.dart';
import '../clientes/widgets/clientes_button.dart';
import 'widgets/directory_path.dart';

class ConfiguracaoFtpPage extends StatefulWidget {
  ConfiguracaoFtpPage({super.key});

  @override
  _ConfiguracaoFtpPageState createState() => _ConfiguracaoFtpPageState();
}

class _ConfiguracaoFtpPageState extends State<ConfiguracaoFtpPage> {
  ConfiguracaoFtpController configuracaoFtpController =
      Get.put(ConfiguracaoFtpController());

  final enderecoSincronizacaoController = TextEditingController();
  final enderecoImagensController = TextEditingController();
  final usuarioFTPController = TextEditingController();
  final senhaFTPController = TextEditingController();

  double _downloadProgress = 0.0; // Variável para armazenar o progresso
  bool? conectado;
  String mensagem = '';

  @override
  void dispose() {
    super.dispose();
    configuracaoFtpController.conectado = null;
    configuracaoFtpController.mensagem = '';
  }

  @override
  Widget build(BuildContext context) {
    enderecoSincronizacaoController.text = '191.252.83.183';
    enderecoImagensController.text = 'app.galle.com.br/images/grandes';
    usuarioFTPController.text = 'palm03@galle';
    senhaFTPController.text = 'Jequitiba1602!';

    return Scaffold(
      backgroundColor: ColorsApp.screenBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsApp.appBarBackground,
        foregroundColor: ColorsApp.appBarForeground,
        centerTitle: true,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.filter_drama),
            Text(Strings.configuracaoFtp),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Space.spacing_12),
            SizedBox(
              height: Sizes.sizeH_40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClientesButton(
                      onPress: () {
                        Navigator.of(context).pop();
                      }, // Função cancelar
                      titulo: Strings.cancelar,
                      icone: Icons.cancel_presentation_outlined),
                  ClientesButton(
                    onPress: () {}, // Função salvar
                    titulo: Strings.salvar,
                    icone: Icons.check_box,
                  ),
                ],
              ),
            ),
            const SizedBox(height: Space.spacing_12),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_12),
              child: TextField(
                controller: enderecoSincronizacaoController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: Strings.enderecoSincronizacao,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_12),
              child: TextField(
                controller: enderecoImagensController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: Strings.enderecoImagens,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_12),
              child: TextField(
                controller: usuarioFTPController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: Strings.usuarioDeFTP,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_12),
              child: TextField(
                controller: senhaFTPController,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: Strings.senhaDeFTP,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 36),

            // Barra de progresso linear

            ClientesButton(
              onPress: () async {
                // configuracaoFtpController.conectado = null;
                // configuracaoFtpController.mensagem = '';
                await configuracaoFtpController.testeConexaoFTP(
                    enderecoSincronizacaoController.text,
                    usuarioFTPController.text,
                    senhaFTPController.text);

                //!  ABAIXO, EXECUTADO SOMENTE PARA BAIXAR O ARQUIVO Cliente.xml
                // conexaoFTP();
              },
              titulo: "Testar Conexão",
              icone: Icons.wifi,
            ),
            const SizedBox(height: Space.spacing_24),
            GetBuilder<ConfiguracaoFtpController>(builder: (context) {
              return configuracaoFtpController.conectado == null
                  ? const Icon(
                      Icons.check,
                      color: Color.fromRGBO(224, 225, 221, 1),
                      size: 100.0,
                    )
                  : Icon(
                      configuracaoFtpController.conectado!
                          ? Icons.check
                          : Icons.do_disturb,
                      color: configuracaoFtpController.conectado!
                          ? Colors.green
                          : Colors.red,
                      size: 100.0,
                    );
            }),
            const SizedBox(height: Space.spacing_24),
            GetBuilder<ConfiguracaoFtpController>(builder: (context) {
              return Text(
                configuracaoFtpController.mensagem,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: Font.title_18,
                  fontWeight: FontWeight.w700,
                ),
              );
            }),

            // Padding(
            //   padding: const EdgeInsets.all(Space.spacing_24),
            //   child: LinearProgressIndicator(
            //     backgroundColor: const Color.fromARGB(255, 114, 153, 165),
            //     color: const Color.fromARGB(255, 22, 66, 114),
            //     value: _downloadProgress, // Mostra o progresso do download
            //     minHeight: 20,
            //   ),
            // ),
            // const SizedBox(height: 20),
            // // Progresso em texto
            // Text(
            //   '${(_downloadProgress * 100).toStringAsFixed(0)}%',
            //   style: const TextStyle(fontSize: 24),
            // ),
          ],
        ),
      ),
    );
  }

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

      setState(() {
        conectado;
        mensagem = 'CONECTADO COM SUCESSO';
      });

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
      setState(() {
        conectado;
        mensagem;
      });
      // print('Erro: $e');
    }
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
          setState(() {
            _downloadProgress = progressInPercent / 100;
          });
          print('Progresso: ${progressInPercent.toStringAsFixed(2)}%');
          print('Total recebido: $totalReceived de $fileSize bytes');
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

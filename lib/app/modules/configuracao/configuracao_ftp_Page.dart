//! Para acessar o ftp --> ftpconnect
//! Para conseguir baixar o arquivo e gravá-lo no dispositivo --> veja permission_handler
//! Param conseguir gravar o arquivo no dispositivo --> veja open_file_plus
//! Encontra locais comumente usados no sistema de arquivos --> path_provider

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ftpconnect/ftpconnect.dart';

import '../../core/colors_app.dart';
import '../../core/sizes.dart';
import '../../core/space.dart';
import '../../core/strings.dart';
import '../clientes/widgets/clientes_button.dart';
import 'widgets/directory_path.dart';

class ConfiguracaoFtpPage extends StatelessWidget {
  ConfiguracaoFtpPage({super.key});

  final enderecoSincronizacaoController = TextEditingController();
  final enderecoImagensController = TextEditingController();
  final usuarioFTPController = TextEditingController();
  final senhaFTPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: Space.spacing_12,
            ),
            SizedBox(
              height: Sizes.sizeH_40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClientesButton(
                      onPress: () {},
                      titulo: Strings.cancelar,
                      icone: Icons.cancel_presentation_outlined),
                  ClientesButton(
                    onPress: () {},
                    titulo: Strings.salvar,
                    icone: Icons.check_box,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Space.spacing_12,
            ),
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
            const SizedBox(
              height: 36,
            ),
            ClientesButton(
                onPress: conexaoFTP,
                titulo: "TESTAR",
                icone: Icons.assist_walker_outlined),
          ],
        ),
      ),
    );
  }

  conexaoFTP() async {
    // FTPConnect ftpConnect = FTPConnect(enderecoSincronizacaoController.text,
    //     user: usuarioFTPController.text, pass: senhaFTPController.text);
    FTPConnect ftpConnect = FTPConnect('191.252.83.183',
        user: 'palm03@galle', pass: 'Jequitiba1602!');
    try {
      // String fileName = 'arq.zip';
      String fileName = 'arq.zip';
      var getPathFile = DirectoryPath();
      var storePath = await getPathFile.getPath();
      late String filePath;
      filePath = '$storePath/$fileName';
      print('Procurando arquivo=> $fileName');
      var conectou = await ftpConnect.connect();
      print('Conectou--> $conectou');
      var arqexiste = await ftpConnect.existFile(fileName);
      print('Arquivo existe?--> $arqexiste');
      var arqTamanho = await ftpConnect.sizeFile(fileName);
      print('Arquivo Tamanho?--> $arqTamanho');

      var listaDiretorio = await ftpConnect.listDirectoryContent();
      print('Listando diretório');

      print(listaDiretorio);
      print("INICIO DO DOWNLOAD");


//-

//-
      var arquivo = File(filePath);
      var x = await ftpConnect.downloadFileWithRetry(
        fileName,
        arquivo,
        pRetryCount: 2,
        onProgress: (progressInPercent, totalReceived, arqtamanho) {},
      );
      print('download--> $x');
      print("FIM DO DOWNLOAD");

      // var x = await ftpConnect.downloadFile(
      //   fileName,
      //   File(filePath),
      // );
      // print('download do arq.zip--> $x');
      //! extrai o conteúdo do arq.zip
      //! var unzipOk = await getPathFile.extractZip();
      // print('unzip --> $unzipOk');

      // conectou = await ftpConnect.disconnect();
      // print('Desconectou--> $conectou');
    } catch (e) {
      print(e);
    }
  }

 

  progressoDownload(
      double progressInPercent, int totalReceived, int fileSize) {}

  // conexaoFTP() async {
  //   // FTPConnect ftpConnect = FTPConnect(enderecoSincronizacaoController.text,
  //   //     user: usuarioFTPController.text, pass: senhaFTPController.text);
  //   FTPConnect ftpConnect = FTPConnect('191.252.83.183',
  //       user: 'palm03@galle', pass: 'Jequitiba1602!');
  //   try {
  //     String fileName = 'arq.zip';
  //     print('Procurando arquivo=> $fileName');
  //     var conectou = await ftpConnect.connect();
  //     print('Conectou--> $conectou');
  //     var arqexiste = await ftpConnect.existFile(fileName);
  //     print('Arquivo existe?--> $arqexiste');
  //     var listaDiretorio = await ftpConnect.listDirectoryContent();
  //     print('Listando diretório');
  //     print(listaDiretorio);
  //     var x = await ftpConnect.downloadFile(
  //       fileName,
  //       File('arq.zip'),
  //     );
  //     print('download do arq.zip--> $x');
  //     conectou = await ftpConnect.disconnect();
  //     print('Desconectou--> $conectou');
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}

// //! Para acessar o ftp --> ftpconnect
// //! Para conseguir baixar o arquivo e gravá-lo no dispositivo --> veja permission_handler
// //! Param conseguir gravar o arquivo no dispositivo --> veja open_file_plus
// //! Encontra locais comumente usados no sistema de arquivos --> path_provider

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ftpconnect/ftpconnect.dart';
import '../../core/colors_app.dart';
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
  final enderecoSincronizacaoController = TextEditingController();
  final enderecoImagensController = TextEditingController();
  final usuarioFTPController = TextEditingController();
  final senhaFTPController = TextEditingController();

  double _downloadProgress = 0.0; // Variável para armazenar o progresso

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
                      onPress: () {}, // Função cancelar
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
              onPress: () =>
                  conexaoFTP(), // Chama a função para conectar ao FTP e iniciar o download
              titulo: "TESTAR",
              icone: Icons.assist_walker_outlined,
            ),
            SizedBox(height: Space.spacing_12),
            Padding(
              padding: const EdgeInsets.all(Space.spacing_24),
              child: LinearProgressIndicator(
                backgroundColor: const Color.fromARGB(255, 114, 153, 165),
                color: const Color.fromARGB(255, 22, 66, 114),
                value: _downloadProgress, // Mostra o progresso do download
                minHeight: 20,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${(_downloadProgress * 100).toStringAsFixed(2)}%',
              style: const TextStyle(fontSize: 24),
            ), // Progresso em texto
          ],
        ),
      ),
    );
  }

  conexaoFTP() async {
    // FTPConnect ftpConnect = FTPConnect('191.252.83.183',
    //     user: 'palm03@galle', pass: 'Jequitiba1602!');
    FTPConnect ftpConnect = FTPConnect(enderecoSincronizacaoController.text,
        user: usuarioFTPController.text, pass: senhaFTPController.text);
    String fileName = 'arq.zip';
    var getPathFile = DirectoryPath();
    var storePath = await getPathFile.getPath();
    late String filePath;
    filePath = '$storePath/$fileName';

    var arquivo = File(filePath);
    print('arquivo--> $arquivo');
    try {
      // Conectando ao servidor
      await ftpConnect.connect();

      // Obtendo o tamanho do arquivo remoto
      int fileSize = await ftpConnect.sizeFile(fileName);
      print('fileSize--> $fileSize');

      // // Criando um arquivo local para salvar o conteúdo
      // File localFile = File(filePath);
      // print('localFile--> $localFile');

      // RandomAccessFile raf = localFile.openSync(mode: FileMode.write);

      // Baixando o arquivo em blocos para calcular o progresso
      await ftpConnect.downloadFileWithRetry(
        fileName,
        arquivo,
        // pRetryCount: 2,
        onProgress: (progressInPercent, totalReceived, fileSize) {
          // Atualiza o progresso do download
          setState(() {
            _downloadProgress = progressInPercent / 100; // Atualiza o progresso
          });
          print('Progresso: ${progressInPercent.toStringAsFixed(2)}%');
          print('Total recebido --> $totalReceived/$fileSize');
        },
      );

      // raf.closeSync();
      print('Download concluído com sucesso!');

      // Desconectando do servidor
      await ftpConnect.disconnect();
    } catch (e) {
      print('Erro durante o download: $e');
    }
  }
}





//*===============================================================================================
// //! Para acessar o ftp --> ftpconnect
// //! Para conseguir baixar o arquivo e gravá-lo no dispositivo --> veja permission_handler
// //! Param conseguir gravar o arquivo no dispositivo --> veja open_file_plus
// //! Encontra locais comumente usados no sistema de arquivos --> path_provider

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:ftpconnect/ftpconnect.dart';

// import '../../core/colors_app.dart';
// import '../../core/sizes.dart';
// import '../../core/space.dart';
// import '../../core/strings.dart';
// import '../clientes/widgets/clientes_button.dart';
// import 'widgets/directory_path.dart';

// class ConfiguracaoFtpPage extends StatelessWidget {
//   ConfiguracaoFtpPage({super.key});

//   final enderecoSincronizacaoController = TextEditingController();
//   final enderecoImagensController = TextEditingController();
//   final usuarioFTPController = TextEditingController();
//   final senhaFTPController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorsApp.screenBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: ColorsApp.appBarBackground,
//         foregroundColor: ColorsApp.appBarForeground,
//         centerTitle: true,
//         title: const Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Icon(Icons.filter_drama),
//             Text(Strings.configuracaoFtp),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: Space.spacing_12,
//             ),
//             SizedBox(
//               height: Sizes.sizeH_40,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ClientesButton(
//                       onPress: () {},
//                       titulo: Strings.cancelar,
//                       icone: Icons.cancel_presentation_outlined),
//                   ClientesButton(
//                     onPress: () {},
//                     titulo: Strings.salvar,
//                     icone: Icons.check_box,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: Space.spacing_12,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(Space.spacing_12),
//               child: TextField(
//                 controller: enderecoSincronizacaoController,
//                 keyboardType: TextInputType.text,
//                 decoration: const InputDecoration(
//                   labelText: Strings.enderecoSincronizacao,
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(Space.spacing_12),
//               child: TextField(
//                 controller: enderecoImagensController,
//                 keyboardType: TextInputType.text,
//                 decoration: const InputDecoration(
//                   labelText: Strings.enderecoImagens,
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(Space.spacing_12),
//               child: TextField(
//                 controller: usuarioFTPController,
//                 keyboardType: TextInputType.text,
//                 decoration: const InputDecoration(
//                   labelText: Strings.usuarioDeFTP,
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(Space.spacing_12),
//               child: TextField(
//                 controller: senhaFTPController,
//                 obscureText: true,
//                 keyboardType: TextInputType.text,
//                 decoration: const InputDecoration(
//                   labelText: Strings.senhaDeFTP,
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 36,
//             ),
//             ClientesButton(
//                 onPress: conexaoFTP,
//                 titulo: "TESTAR",
//                 icone: Icons.assist_walker_outlined),
//           ],
//         ),
//       ),
//     );
//   }

//   conexaoFTP() async {
//     FTPConnect ftpConnect = FTPConnect('191.252.83.183',
//         user: 'palm03@galle', pass: 'Jequitiba1602!');
//     String fileName = 'arq.zip';
//     var getPathFile = DirectoryPath();
//     var storePath = await getPathFile.getPath();
//     late String filePath;
//     filePath = '$storePath/$fileName';

//     var arquivo = File(filePath);
//     print('arquivo--> $arquivo');
//     try {
//       // Conectando ao servidor
//       await ftpConnect.connect();

//       // Obtendo o tamanho do arquivo remoto
//       int fileSize = await ftpConnect.sizeFile(fileName);
//       print('fileSize--> $fileSize');

//       // Criando um arquivo local para salvar o conteúdo
//       File localFile = File(filePath);
//       print('localFile--> $localFile');

//       // Baixando o arquivo em blocos para calcular o progresso

//       await ftpConnect.downloadFile(
//         fileName,
//         arquivo,
//         // pRetryCount: 20,
//         onProgress: (progressInPercent, totalReceived, fileSize) {
//           // Exibir o progresso no console
//           print('Progresso: ${progressInPercent.toStringAsFixed(2)}%');
//           print('Total recebido: $totalReceived bytes de $fileSize bytes');
//         },
//       );

//       print('Download concluído com sucesso!');

//       // Desconectando do servidor
//       await ftpConnect.disconnect();
//       print('localFile--> ${localFile}');
//     } catch (e) {
//       print('Erro durante o download: $e');
//     }
//   }

//   // conexaoFTP() async {
//   //   // FTPConnect ftpConnect = FTPConnect(enderecoSincronizacaoController.text,
//   //   //     user: usuarioFTPController.text, pass: senhaFTPController.text);
//   //   FTPConnect ftpConnect = FTPConnect('191.252.83.183',
//   //       user: 'palm03@galle', pass: 'Jequitiba1602!');
//   //   String fileName = 'arq.zip';
//   //   var getPathFile = DirectoryPath();
//   //   var storePath = await getPathFile.getPath();
//   //   late String filePath;
//   //   filePath = '$storePath/$fileName';

//   //   var arquivo = File(filePath);
//   //   print('arquivo--> $arquivo');
//   //   try {
//   //     // Conectando ao servidor
//   //     await ftpConnect.connect();

//   //     // Obtendo o tamanho do arquivo remoto
//   //     // int fileSize = await ftpConnect.sizeFile('caminho/remoto/do/arquivo.txt');
//   //     int fileSize = await ftpConnect.sizeFile(fileName);
//   //     print('fileSize--> $fileSize');
//   //     int downloadedSize = 0;

//   //     // Criando um arquivo local para salvar o conteúdo
//   //     // File localFile = File('caminho/local/para/salvar/arquivo.txt');
//   //     File localFile = File(filePath);
//   //     print('localFile--> $localFile');

//   //     RandomAccessFile raf = localFile.openSync(mode: FileMode.write);

//   //     // Baixando o arquivo em blocos para calcular o progresso
//   //     await ftpConnect.downloadFileWithRetry(
//   //       fileName,
//   //       arquivo,
//   //       pRetryCount: 2,
//   //       onProgress: (progressInPercent, totalReceived, fileSize) {

//   //       },
//   //     );

//   //     raf.closeSync();
//   //     print('Download concluído com sucesso!');

//   //     // Desconectando do servidor
//   //     await ftpConnect.disconnect();
//   //   } catch (e) {
//   //     print('Erro durante o download: $e');
//   //   }
//   // }

//   //! antigo abaixo
// //   conexaoFTP2() async {
// //     // FTPConnect ftpConnect = FTPConnect(enderecoSincronizacaoController.text,
// //     //     user: usuarioFTPController.text, pass: senhaFTPController.text);
// //     FTPConnect ftpConnect = FTPConnect('191.252.83.183',
// //         user: 'palm03@galle', pass: 'Jequitiba1602!');
// //     String fileName = 'arq.zip';
// //     var getPathFile = DirectoryPath();
// //     var storePath = await getPathFile.getPath();
// //     late String filePath;
// //     filePath = '$storePath/$fileName';

// //     var arquivo = File(filePath);
// //     print('arquivo--> $arquivo');
// //     try {
// // //! com chat
// //       // Configure seu servidor FTP
// //       FTPConnect ftpConnect = FTPConnect('191.252.83.183',
// //           user: 'palm03@galle', pass: 'Jequitiba1602!');
// //       // FTPConnect ftpConnect = FTPConnect('ftp.seuservidor.com',
// //       //     user: 'seu_usuario', pass: 'sua_senha');

// //       // Conecta ao servidor FTP
// //       await ftpConnect.connect();

// //       // Faz o download do arquivo
// //       bool result = await ftpConnect.downloadFile(
// //         fileName,
// //         arquivo,
// //       );

// //       if (result) {
// //         print('Download concluído com sucesso!');
// //       } else {
// //         print('Falha no download.');
// //       }

// //       // Encerra a conexão
// //       await ftpConnect.disconnect();

// // //! com chat

// //       // print("conectado");
// //       // await ftpConnect.connect();
// //       // await ftpConnect.downloadFile(fileName, arquivo);
// //       // await ftpConnect.disconnect();
// //       // print("desconectado");

// //       // print('Procurando arquivo=> $fileName');
// //       // var conectou = await ftpConnect.connect();
// //       // print('Conectou--> $conectou');
// //       // var arqexiste = await ftpConnect.existFile(fileName);
// //       // print('Arquivo existe?--> $arqexiste');
// //       // var arqTamanho = await ftpConnect.sizeFile(fileName);
// //       // print('Arquivo Tamanho?--> $arqTamanho');

// //       // var listaDiretorio = await ftpConnect.listDirectoryContent();
// //       // print('Listando diretório');

// //       // print(listaDiretorio);
// //       // print("INICIO DO DOWNLOAD");

// // //-

// // //--
// //       // var arquivo = File(filePath);
// //       // var x = await ftpConnect.downloadFileWithRetry(
// //       //   fileName,
// //       //   arquivo,
// //       //   pRetryCount: 2,
// //       //   onProgress: (progressInPercent, totalReceived, arqtamanho) {},
// //       // );
// //       // print('download--> $x');
// //       // print("FIM DO DOWNLOAD");
// // //--
// //       // var x = await ftpConnect.downloadFile(
// //       //   fileName,
// //       //   File(filePath),
// //       // );
// //       // print('download do arq.zip--> $x');
// //       //! extrai o conteúdo do arq.zip
// //       //! var unzipOk = await getPathFile.extractZip();
// //       // print('unzip --> $unzipOk');

// //       // conectou = await ftpConnect.disconnect();
// //       // print('Desconectou--> $conectou');
// //     } catch (e) {
// //       print('ERROOOOOOOOOOOOOOOOOO');
// //       print('Erro--> $e');
// //     }
// //   }

//   // progressoDownload(
//   //     double progressInPercent, int totalReceived, int fileSize) {

//   //     }

//   // conexaoFTP() async {
//   //   // FTPConnect ftpConnect = FTPConnect(enderecoSincronizacaoController.text,
//   //   //     user: usuarioFTPController.text, pass: senhaFTPController.text);
//   //   FTPConnect ftpConnect = FTPConnect('191.252.83.183',
//   //       user: 'palm03@galle', pass: 'Jequitiba1602!');
//   //   try {
//   //     String fileName = 'arq.zip';
//   //     print('Procurando arquivo=> $fileName');
//   //     var conectou = await ftpConnect.connect();
//   //     print('Conectou--> $conectou');
//   //     var arqexiste = await ftpConnect.existFile(fileName);
//   //     print('Arquivo existe?--> $arqexiste');
//   //     var listaDiretorio = await ftpConnect.listDirectoryContent();
//   //     print('Listando diretório');
//   //     print(listaDiretorio);
//   //     var x = await ftpConnect.downloadFile(
//   //       fileName,
//   //       File('arq.zip'),
//   //     );
//   //     print('download do arq.zip--> $x');
//   //     conectou = await ftpConnect.disconnect();
//   //     print('Desconectou--> $conectou');
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }
// }

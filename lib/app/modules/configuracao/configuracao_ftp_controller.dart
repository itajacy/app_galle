import 'package:ftpconnect/ftpconnect.dart';
import 'package:get/get.dart';

class ConfiguracaoFtpController extends GetxController {
  bool? conectado;
  String mensagem = '';

  testeConexaoFTP(String endereco, String usuario, String senha) async {
    FTPConnect ftpConnect = FTPConnect(endereco, user: usuario, pass: senha);

    try {
      mensagem = 'Aguarde, conexão em andamento...';
      update();
      // Conectando ao servidor
      conectado = await ftpConnect.connect();
      update();

      mensagem = 'CONECTADO COM SUCESSO';
      update();

      // Desconectando do servidor
      await ftpConnect.disconnect();
    } catch (e) {
      //* FTPConnectException: Wrong Username/password (Response: 530 User or password not found)
      conectado = false;
      if (e.toString().contains('530')) {
        mensagem = 'Usuário e/ou Senha inválido(s)';
      } else {
        mensagem = 'Falha ao conectar:  ${e.toString()}';
      }
      update();
    }
  }
}

//* alterado em 24/09/24
import 'package:galle/app/modules/clientes/clientes_controller.dart';

class ClientesAlteracaoController extends ClientesController {

  Future<bool> updateCliente({required bool? isSave}) async {
    if (cliente.cNPJCPF == null || cliente.cNPJCPF == "") {
      cnpjCpfError = 'O CNP/CPF NÃO PODE SER VAZIO!';
      update();
      // return false;
      return false;
    }

    if (cliente.email == null || cliente.email == "") {
      emailError = 'O EMAIL NÃO PODE SER VAZIO!';
      update();
      return false;
    }

    if (cliente.fone1!.isEmpty &&
        cliente.fone2!.isEmpty &&
        cliente.foneCel!.isEmpty &&
        cliente.foneRes!.isEmpty &&
        cliente.fax!.isEmpty) {
      fone1Error = 'É exigido ao menos um telefone de contato!';
      fone2Error = 'É exigido ao menos um telefone de contato!';
      foneCelError = 'É exigido ao menos um telefone de contato!';
      foneResError = 'É exigido ao menos um telefone de contato!';
      faxError = 'É exigido ao menos um telefone de contato!';

      update();
      return false;
    }

    if (cliente.pUF == "" || cliente.pUF == null) {
      pUFError = 'SELECIONE O ESTADO';
      update();
      return false;
    }

    if (cliente.eCidade != "") {
      if (cliente.eUF == "" || cliente.eUF == null) {
        eUFError = 'ESCOLHA O ESTADO';
        update();
        return false;
      }
    }
    int resposta = await clientesDao.alterar(cliente);
    update();
    return resposta > 0 ? true : false;
  }
}

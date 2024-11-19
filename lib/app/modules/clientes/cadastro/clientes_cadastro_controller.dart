//* Alterado em 24/09/2024

import 'package:galle/app/modules/clientes/clientes_controller.dart';
import 'package:galle/app/modules/sincronizacao/sincronizacao_dispositivo_controller.dart';

class ClientesCadastroController extends ClientesController {
  SincronizacaoDispositivoController sincronizacaoDispositivoController =
      SincronizacaoDispositivoController();

  Future<bool> save({required bool? isSave}) async {
    

    if (cliente.cNPJCPF == null || cliente.cNPJCPF == "") {
      cnpjCpfError = 'O CNP/CPF NÃO PODE SER VAZIO!';
      update();
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

// todo inicio, pegando os dados do dispositivo, tirando do cadastroClientesPage
    await sincronizacaoDispositivoController.buscarDispositivo();

    // clientesCadastroController.cliente.clienteId = 0;

    cliente.dispositivoId =
        sincronizacaoDispositivoController.dispositivo.dispositivoId;
    cliente.clienteIdMob =
        (int.parse(sincronizacaoDispositivoController.dispositivo.seqCliente!) +
                1)
            .toString();
    cliente.clienteIdInt =
        sincronizacaoDispositivoController.dispositivo.representanteIdInt;
    cliente.ativo = "1";
//todo fim,

    int resposta = await clientesDao.salvar(cliente);
    if (resposta > 0) {
      sincronizacaoDispositivoController.alterarDispositivo();
    }
    update();
    return resposta > 0 ? true : false;
  }
}

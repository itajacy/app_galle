import 'package:galle/app/services/database/dao/clientes_dao.dart';
import 'package:get/get.dart';

import '../../../models/cliente.dart';

class ClientesCadastroController extends GetxController {
  ClientesDao clientesDao = ClientesDao();

  Cliente cliente = Cliente();

  String? nomeFantasiaError;
  String? razaoSocialError;
  String? tipoPessoaError;
  String? cnpjCpfError;
  String? iERGError;
  String? contatoError;
  String? emailError;
  String? fone1Error;
  String? fone2Error;
  String? foneCelError;
  String? foneResError;
  String? faxError;

  String? pUFError;
  String? pCidadeError;
  String? pEnderecoError;
  String? pComplementoError;
  String? pBairroError;
  String? pCEPError;

  String? eUFError;
  String? eCidadeError;
  String? eEnderecoError;
  String? eComplementoError;
  String? eBairroError;
  String? eCEPError;

  

  //! O método save(), precisa retornar algo indicando que salvou com sucesso, ou não
  //! para que o retorno possa ser tratado e ser exibida a mensagem de SUCESSO ou ERRO
  //! na tela de cadastro usando o SNACKBAR

//! ## INICIO DO save()
  Future<bool> save({required bool? isSave}) async {
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
    int resposta = await clientesDao.salvar(cliente);

    print('reposta do clientesDao.salvar(cliente)..: ' + resposta.toString());

    update();
    return resposta > 0 ? true : false;
  }
//! ## FIM DO save()

//! INICIO DO alterar()
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

    print('reposta do clientesDao.alterar(cliente)..: ' + resposta.toString());

    update();
    return resposta > 0 ? true : false;
  }

//! FIM DO alterar()

// SET'S

  void setNomeFantasia(String value) {
    cliente.nomeFantasia = value;
    nomeFantasiaError = null;
    update();
  }

  void setRazaoSocial(String value) {
    cliente.razaoSocial = value;
    razaoSocialError = null;
    update();
  }

  //! ser visto depois.  deve ser "F" ou "J"
  void setTipoPessoa(String value) {
    cliente.tipoPessoa = value;
    tipoPessoaError = null;
    update();
  }

  //! Como Validar?  Como definir a formatação?
  void setCnpjCpf(String value) {
    cliente.cNPJCPF = value;
    cnpjCpfError = null;
    update();
  }

//! Como Validar?  Definir formatação
  void setIeRg(String value) {
    cliente.iERG = value;
    iERGError = null;
    update();
  }

  void setContato(String value) {
    cliente.contato = value;
    contatoError = null;
    update();
  }

//! Como Validar?
  void setEmail(String value) {
    cliente.email = value;
    emailError = null;
    update();
  }

  void setFone1(String value) {
    cliente.fone1 = value;
    foneError();
    update();
  }

  void setFone2(String value) {
    cliente.fone2 = value;
    foneError();
    update();
  }

  void setFoneCel(String value) {
    cliente.foneCel = value;
    foneError();
    update();
  }

  void setFoneRes(String value) {
    cliente.foneRes = value;
    foneError();
    update();
  }

  void setFax(String value) {
    cliente.fax = value;
    foneError();
    update();
  }

  void foneError() {
    fone1Error = null;
    fone2Error = null;
    foneCelError = null;
    foneResError = null;
    faxError = null;
  }

//---

//!  Como receber e tratar UF principal

  void setpUF(String value) {
    cliente.pUF = value;
    pUFError = null;
    update();
  }

  void setpCidade(String value) {
    cliente.pCidade = value;
    pCidadeError = null;
    update();
  }

  void setpEndereco(String value) {
    cliente.pEndereco = value;
    pEnderecoError = null;
    update();
  }

  void setpComplemento(String value) {
    cliente.pComplemento = value;
    pComplementoError = null;
    update();
  }

  void setpBairro(String value) {
    cliente.pBairro = value;
    pBairroError = null;
    update();
  }

  void setpCEP(String value) {
    cliente.pCEP = value;
    pCEPError = null;
    update();
  }

//---
//!  Como receber e tratar UF de entrega

  void seteUF(String value) {
    cliente.eUF = value;
    eUFError = null;
    update();
  }

  void seteCidade(String value) {
    cliente.eCidade = value;
    eCidadeError = null;
    update();
  }

  void seteEndereco(String value) {
    cliente.eEndereco = value;
    pEnderecoError = null;
    update();
  }

  void seteComplemento(String value) {
    cliente.eComplemento = value;
    eComplementoError = null;
    update();
  }

  void seteBairro(String value) {
    cliente.eBairro = value;
    eBairroError = null;
    update();
  }

  void seteCEP(String value) {
    cliente.eCEP = value;
    eCEPError = null;
    update();
  }

  void copiarEnderecoPrincipal() {
    if (cliente.pUF == "" || cliente.pUF == null) {
      pUFError = 'SELECIONE O ESTADO!!';
      update();
      return;
    } else {
      cliente.eUF = cliente.pUF;
      cliente.eCidade = cliente.pCidade;
      cliente.eEndereco = cliente.pEndereco;
      cliente.eComplemento = cliente.pComplemento;
      cliente.eBairro = cliente.pBairro;
      cliente.eCEP = cliente.pCEP;
      update();
    }
  }
}

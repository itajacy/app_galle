//* alterado em 24/09/24

import 'package:galle/app/services/database/dao/clientes_dao.dart';
import 'package:get/get.dart';

import '../../models/cliente.dart';

class ClientesController extends GetxController {
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

  void setTipoPessoa(String value) {
    cliente.tipoPessoa = value;
    tipoPessoaError = null;
    update();
  }

  void setCnpjCpf(String value) {
    cliente.cNPJCPF = value;
    cnpjCpfError = null;
    update();
  }

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

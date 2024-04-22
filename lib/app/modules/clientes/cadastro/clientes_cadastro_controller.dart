import 'package:galle/app/services/database/dao/clientes_dao.dart';

import '../../../models/cliente.dart';

class ClientesCadastroController {
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
  String? foneResError;

  String? pCidadeError;
  String? pEnderecoError;
  String? pComplementoError;
  String? pBairroError;
  String? pCEPError;

  String? eCidadeError;
  String? eEnderecoError;
  String? eComplementoError;
  String? eBairroError;
  String? eCEPError;


  save() async {
    if (cliente.nomeFantasia!.isEmpty) {
      nomeFantasiaError = 'O NOME NÃO PODE SER VAZIO!';
      return;
    }

    if (cliente.razaoSocial!.isEmpty) {
      razaoSocialError = 'A RAZÃO SOCIAL NÃO PODE SER VAZIA!';
      return;
    }

    if (cliente.cNPJCPF!.isEmpty) {
      cnpjCpfError = 'O CNP/CPF NÃO PODE SER VAZIO!';
      return;
    }

    int resposta = await clientesDao.salvar(cliente);
    // print('reposta do clientesDao.salvar(cliente)..: ' + resposta.toString());
  }

  void setNomeFantasia(String value) {
    cliente.nomeFantasia = value;
    nomeFantasiaError = null;
  }

  void setRazaoSocial(String value) {
    cliente.razaoSocial = value;
    razaoSocialError = null;
  }

  //! ser visto depois
  void setTipoPessoa(String value) {
    cliente.tipoPessoa = value;
    tipoPessoaError = null;
  }

  void setCnpjCpf(String value) {
    cliente.cNPJCPF = value;
    cnpjCpfError = null;
  }

  void setIeRg(String value) {
    cliente.iERG = value;
    iERGError = null;
  }

  void setContato(String value) {
    cliente.contato = value;
    contatoError = null;
  }

  void setEmail(String value) {
    cliente.email = value;
    emailError = null;
  }

  void setFone1(String value) {
    cliente.fone1 = value;
    fone1Error = null;
  }

  void setFone2(String value) {
    cliente.fone2 = value;
    fone2Error = null;
  }

  void setFoneRes(String value) {
    cliente.foneRes = value;
    foneResError = null;
  }

//---
  void setpCidade(String value) {
    cliente.pCidade = value;
    pCidadeError = null;
  }

  void setpEndereco(String value) {
    cliente.pEndereco = value;
    pEnderecoError = null;
  }

  void setpComplemento(String value) {
    cliente.pComplemento = value;
    pComplementoError = null;
  }

  void setpBairro(String value) {
    cliente.pBairro = value;
    pBairroError = null;
  }

  void setpCEP(String value) {
    cliente.pCEP = value;
    pCEPError = null;
  }

//---
  void seteCidade(String value) {
    cliente.eCidade = value;
    eCidadeError = null;
  }

  void seteEndereco(String value) {
    cliente.eEndereco = value;
    pEnderecoError = null;
  }

  void seteComplemento(String value) {
    cliente.eComplemento = value;
    eComplementoError = null;
  }

  void seteBairro(String value) {
    cliente.eBairro = value;
    eBairroError = null;
  }

  void seteCEP(String value) {
    cliente.eCEP = value;
    eCEPError = null;
  }


//!  FAZER PARA TODOS OS CAMPOS E LEMBRAR DE ALTERAR EM CLIENTES CADASTRO
}

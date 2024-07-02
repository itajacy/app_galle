import 'package:galle/app/services/database/dao/clientes_dao.dart';
import 'package:get/get.dart';

import '../../../models/cliente.dart';

class ClientesCadastroController extends GetxController {
  ClientesDao clientesDao = ClientesDao();

  Cliente cliente = Cliente();

  //!  FALTAM OS ALGUNS CAMPOS DA TABELA AQUI
  //

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

  save() async {
    // if (cliente.nomeFantasia!.isEmpty) {
    //   nomeFantasiaError = 'O NOME NÃO PODE SER VAZIO!';
    //   return;
    // }

    // if (cliente.razaoSocial!.isEmpty) {
    //   razaoSocialError = 'A RAZÃO SOCIAL NÃO PODE SER VAZIA!';
    //   return;
    // }

    if (cliente.cNPJCPF == null || cliente.cNPJCPF == "") {
      cnpjCpfError = 'O CNP/CPF NÃO PODE SER VAZIO!';
      update();
      return;
    }

    // if (cliente.contato!.isEmpty) {
    //   contatoError = 'O CONTATO NÃO PODE SER VAZIO!';
    //   return;
    // }

    // if (cliente.email!.isEmpty) {
    //   emailError = 'O EMAIL NÃO PODE SER VAZIO!';
    //   return;
    // }

    // if (cliente.fone1!.isEmpty) {
    //   fone1Error = 'O TELEFONE NÃO PODE SER VAZIO!';
    //   return;
    // }

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
      return;
    }

    if (cliente.pUF!.isEmpty) {
      pUFError = 'SELECIONE O ESTADO';
      update();
      return;
    }
    // if (cliente.pCidade!.isEmpty) {
    //   pCidadeError = 'A CIDADE NÃO PODE SER VAZIA!';
    //   return;
    // }

    // if (cliente.pEndereco!.isEmpty) {
    //   pEnderecoError = 'O ENDEREÇO NÃO PODE SER VAZIO!';
    //   return;
    // }

    // if (cliente.pBairro!.isEmpty) {
    //   pBairroError = 'O BAIRRO NÃO PODE SER VAZIO!';
    //   return;
    // }

    // if (cliente.pCEP!.isEmpty) {
    //   pCEPError = 'O CEP NÃO PODE SER VAZIO!';
    //   return;
    // }

//!

    if (cliente.pUF == "" || cliente.pUF == null) {
      pUFError = 'ESCOLHA O ESTADO';
      print("mensagem de Erro do cliente,UF --> $pUFError");
      update();
      return;
    }

    if (cliente.eUF == "" || cliente.eUF == null) {
      eUFError = 'ESCOLHA O ESTADO';
      print("mensagem de Erro do cliente,eUF --> $eUFError");
      update();
      return;
    }

    //!  NÃO ESTÁ SALVANDO PARA TESTAR
    //! descomentar a linha abaixo para salvar
    int resposta = await clientesDao.salvar(cliente);
    print('reposta do clientesDao.salvar(cliente)..: ' + resposta.toString());

    update();
  }

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
    fone1Error = null;
    update();
  }

  void setFone2(String value) {
    cliente.fone2 = value;
    fone2Error = null;
    update();
  }

  void setFoneCel(String value) {
    cliente.foneCel = value;
    foneCelError = null;
    update();
  }

  void setFoneRes(String value) {
    cliente.foneRes = value;
    foneResError = null;
    update();
  }

  void setFax(String value) {
    cliente.fax = value;
    faxError = null;
    update();
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
    print('cliente.pUF --> ${cliente.pUF.runtimeType}');

    print('cliente.eUF --> ${cliente.eUF}');
    if (cliente.pUF == "" || cliente.pUF == null) {
      //! Oque/Como fazer para exibir a mensagem de erro abaixo?
      //! exibi-la na mensagem no errorText: do Estado Principal, ou
      //! ou abrir um pop-up ou algo do tipo com a mensagem na tela?
      pUFError = 'SELECIONE O ESTADO!!';
      print(pUFError);
      update();
      return;
    } else {
      //! não faz a copia do cliente principal para o de entrega para testar
      cliente.eUF = cliente.pUF;
      cliente.eCidade = cliente.pCidade;
      cliente.eEndereco = cliente.pEndereco;
      cliente.eComplemento = cliente.pComplemento;
      cliente.eBairro = cliente.pBairro;
      cliente.eCEP = cliente.pCEP;

      print("===============Dados Copiados===============");
      print("Objeto Cliente pUF  Principal.. ${cliente.pUF}");
      print("---------------");
      print("Objeto Cliente eUF  Entrega.... ${cliente.eUF}");
      print("---------------");
      print("Objeto Cliente eCidade.. ${cliente.eCidade}");
      print("Objeto Cliente eEndereco.. ${cliente.eEndereco}");
      print("Objeto Cliente eComplemento.. ${cliente.eComplemento}");
      print("Objeto Cliente eBairro.. ${cliente.eBairro}");
      print("Objeto Cliente eCEP.. ${cliente.eCEP}");
      print("Dados Copiados do Principal -->  Entrega");
      print("----");

      update();
    }
  }

//!  FAZER PARA TODOS OS CAMPOS E LEMBRAR DE ALTERAR EM CLIENTES CADASTRO
}

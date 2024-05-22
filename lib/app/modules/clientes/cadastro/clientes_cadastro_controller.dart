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
  String? foneResError;

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

    // if (cliente.cNPJCPF!.isEmpty) {
    //   cnpjCpfError = 'O CNP/CPF NÃO PODE SER VAZIO!';
    //   return;
    // }

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

    // if (cliente.pUF!.isEmpty) {
    //   pUFError = 'O ESTADO NÃO PODE SER VAZIO!';
    //   return;
    // }
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
    print("CONTEUDO DE cliente.eUF --> ${cliente.eUF}");
    print(cliente.eUF == null);
    print(cliente.eUF.isBlank);
    var x = cliente.eUF.isBlank;
    if (x == true) {
      cliente.eUF = null;
    }
  

    if (cliente.eUF == null) {
      eUFError = 'ESCOLHA O ESTADO';
      print("mensagem de rro do cliente,eUF --> $eUFError");
      update();
      return;
    }

    //!  NÃO ESTÁ SALVANDO PARA TESTAR
    //! int resposta = await clientesDao.salvar(cliente);
    // print('reposta do clientesDao.salvar(cliente)..: ' + resposta.toString());

    update();
  }

//

  void setNomeFantasia(String value) {
    cliente.nomeFantasia = value;
    nomeFantasiaError = null;
  }

  void setRazaoSocial(String value) {
    cliente.razaoSocial = value;
    razaoSocialError = null;
  }

  //! ser visto depois.  deve ser "F" ou "J"
  void setTipoPessoa(String value) {
    cliente.tipoPessoa = value;
    tipoPessoaError = null;
  }

  //! Como Validar?  Como definir a formatação?
  void setCnpjCpf(String value) {
    cliente.cNPJCPF = value;
    cnpjCpfError = null;
  }

//! Como Validar?  Definir formatação
  void setIeRg(String value) {
    cliente.iERG = value;
    iERGError = null;
  }

  void setContato(String value) {
    cliente.contato = value;
    contatoError = null;
  }

//! Como Validar?
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

//!  Como receber e tratar UF principal

  void setpUF(String value) {
    cliente.pUF = value;
    pUFError = null;
  }

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
//!  Como receber e tratar UF de entrega

  void seteUF(String value) {
    cliente.eUF = value;
    eUFError = null;
  }

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

  void copiarEnderecoPrincipal() {
    print('cliente.pUF --> ${cliente.pUF}');
    if (cliente.pUF == null) {
      //! Oque/Como fazer para exibir a mensagem de erro abaixo?
      //! exibi-la na mensagem no errorText: do Estado Principal, ou
      //! ou abrir um pop-up ou algo do tipo com a mensagem na tela?
      pUFError = 'SELECIONE O ESTADO!!';
      print(pUFError);
      update();
      return;
    } else {
      //! não faz a copia do cliente principal para o de entrega para testar
      // cliente.eUF = cliente.pUF;
      cliente.eCidade = cliente.pCidade;
      cliente.eEndereco = cliente.pEndereco;
      cliente.eComplemento = cliente.pComplemento;
      cliente.eBairro = cliente.pBairro;
      cliente.eCEP = cliente.pCEP;

      print("Objeto Cliente eUF.. ${cliente.eUF}");
      print("Objeto Cliente eCidade.. ${cliente.eCidade}");
      print("Objeto Cliente eEndereco.. ${cliente.eEndereco}");
      print("Objeto Cliente eComplemento.. ${cliente.eComplemento}");
      print("Objeto Cliente eBairro.. ${cliente.eBairro}");
      print("Objeto Cliente eCEP.. ${cliente.eCEP}");

      update();
    }
  }

//!  FAZER PARA TODOS OS CAMPOS E LEMBRAR DE ALTERAR EM CLIENTES CADASTRO
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/sizes.dart';
import '../../../core/strings.dart';

enum PessoaFJ<String> { fisica, juridica }

class PessoafjButton extends GetX {
  PessoaFJ? _pessoaFJ = PessoaFJ.fisica;
  String pessoa = "F";

  PessoafjButton({required super.builder});

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: Sizes.sizeH_50,
          width: Sizes.sizeW_180,
          child: ListTile(
            title: const Text(Strings.fisica),
            leading: Radio<PessoaFJ>(
              value: PessoaFJ.fisica,
              groupValue: _pessoaFJ,
              onChanged: (PessoaFJ? value) {
                _pessoaFJ = value;
                pessoa = "F";
              },
            ),
          ),
        ),
        SizedBox(
          height: Sizes.sizeH_50,
          width: Sizes.sizeW_180,
          child: ListTile(
            title: const Text(Strings.juridica),
            leading: Radio<PessoaFJ>(
              value: PessoaFJ.juridica,
              groupValue: _pessoaFJ,
              onChanged: (PessoaFJ? value) {
                _pessoaFJ = value;
                pessoa = "J";
                // retornaPessoa(pessoa);
              },
            ),
          ),
        ),
      ],
    );
  }
}

// String retornaPessoa(String pessoaFJ) {
//   String pessoa = pessoaFJ;
  
//   return pessoa;
// }

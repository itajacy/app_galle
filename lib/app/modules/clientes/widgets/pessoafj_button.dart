import 'package:flutter/material.dart';

import '../../../core/sizes.dart';
import '../../../core/strings.dart';

enum PessoaFJ { fisica, juridica }

class PessoafjButton extends StatefulWidget {
  PessoafjButton({super.key});

  @override
  State<PessoafjButton> createState() => _PessoafjButtonState();
}

class _PessoafjButtonState extends State<PessoafjButton> {
  PessoaFJ? _pessoaFJ = PessoaFJ.fisica;

  @override
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
                setState(
                  () {
                    _pessoaFJ = value;
                  },
                );
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
                setState(
                  () {
                    _pessoaFJ = value;
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

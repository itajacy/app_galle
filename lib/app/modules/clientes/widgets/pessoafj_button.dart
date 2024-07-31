import 'package:flutter/material.dart';

import '../../../core/sizes.dart';
import '../../../core/strings.dart';

enum PessoaFJ { fisica, juridica }

class PessoafjButton extends StatefulWidget {
  final Function(String) pessoa;

  PessoafjButton({required this.pessoa});

  @override
  State<PessoafjButton> createState() => _PessoafjButtonState();
}

class _PessoafjButtonState extends State<PessoafjButton> {
  PessoaFJ? _pessoaFJ = PessoaFJ.fisica;

  //! tentei com initState, mas não deu certo, inclusive parou de funcionar
  @override
  void initState() {
    widget.pessoa("F");
    print("INIT STATE do pessoafjButton-- ");
    super.initState();
  }

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
              // mouseCursor: MaterialStateMouseCursor.clickable,
              value: PessoaFJ.fisica,
              groupValue: _pessoaFJ,
              onChanged: (PessoaFJ? value) {
                setState(
                  () {
                    // widget.pessoa(value.toString());
                    widget.pessoa("F");
                    _pessoaFJ = value;
                  },
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: Sizes.sizeH_50,
          width: Sizes.sizeW_200,
          child: ListTile(
            title: const Text(Strings.juridica),
            leading: Radio<PessoaFJ>(
              value: PessoaFJ.juridica,
              groupValue: _pessoaFJ,
              onChanged: (PessoaFJ? value) {
                setState(
                  () {
                    // widget.pessoa(value.toString());
                    widget.pessoa("J");
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

import 'package:flutter/material.dart';

// /// Flutter code sample for [Radio].

// void main() => runApp(const PessoafjButtonApp());

// class PessoafjButtonApp extends StatelessWidget {
//   const PessoafjButtonApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Radio Sample')),
//         body: const Center(
//           child: PessoafjButton(),
//         ),
//       ),
//     );
//   }
// }

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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: const Text('Física'),
            leading: Radio<PessoaFJ>(
              value: PessoaFJ.fisica,
              groupValue: _pessoaFJ,
              onChanged: (PessoaFJ? value) {
                setState(() {
                  _pessoaFJ = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Jurídica'),
            leading: Radio<PessoaFJ>(
              value: PessoaFJ.juridica,
              groupValue: _pessoaFJ,
              onChanged: (PessoaFJ? value) {
                setState(() {
                  _pessoaFJ = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

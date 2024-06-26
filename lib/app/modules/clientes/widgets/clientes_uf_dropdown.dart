import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';

import '../../../core/strings.dart';

enum ClienteUF {
  ac('AC'),
  al('AL'),
  ap('AP'),
  am('AM'),
  ba('BA'),
  ce('CE'),
  df('DF'),
  es('ES'),
  go('GO'),
  ma('MA'),
  mg('MG'),
  ms('MS'),
  mt('MT'),
  pa('PA'),
  pb('PB'),
  pe('PE'),
  pi('PI'),
  pr('PR'),
  rj('RJ'),
  rn('RN'),
  ro('RO'),
  rr('RR'),
  rs('RS'),
  sc('SC'),
  se('SE'),
  sp('SP'),
  to('TO');

  const ClienteUF(this.uf);
  final String uf;
}

// ignore: must_be_immutable
class ClientesUfDropdown extends StatefulWidget {
  final Function(String) ufRetorno;
  String? msgUFError;
  TextEditingController ufController;

  ClientesUfDropdown({
    super.key,
    required this.ufRetorno,
    required this.msgUFError,
    required this.ufController,
  });

  @override
  State<ClientesUfDropdown> createState() => _ClientesUfDropdownState();
}

class _ClientesUfDropdownState extends State<ClientesUfDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<ClienteUF>(
      label: const Text(Strings.estado),
      errorText: widget.msgUFError,
      controller: widget.ufController,
      onSelected: (ClienteUF? value) {
        setState(() {
          widget.ufRetorno((value!.uf.toString().toUpperCase()));
          widget.msgUFError = null;
        });
      },

      menuHeight: Sizes.sizeH_200,
      width: Sizes.sizeW_170,
      // enableSearch: false,
      dropdownMenuEntries:
          ClienteUF.values.map<DropdownMenuEntry<ClienteUF>>((ClienteUF uf) {
        return DropdownMenuEntry<ClienteUF>(
          value: uf,
          label: uf.name.toUpperCase(),
        );
      }).toList(),
    );
  }
}

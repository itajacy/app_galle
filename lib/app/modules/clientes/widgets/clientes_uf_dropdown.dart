import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';

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

class ClientesUfDropdown extends StatefulWidget {
  const ClientesUfDropdown({super.key});

  @override
  State<ClientesUfDropdown> createState() => _ClientesUfDropdownState();
}

class _ClientesUfDropdownState extends State<ClientesUfDropdown> {
  final ufController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<ClienteUF>(
      initialSelection: ClienteUF.ac,
      controller: ufController,
      requestFocusOnTap: true,
      menuHeight: Sizes.sizeH_200,
      width: Sizes.sizeW_100,
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

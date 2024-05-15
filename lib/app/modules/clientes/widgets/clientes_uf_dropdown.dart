import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';

enum ClienteUF {
  selecione('UF'),
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
  Function(String) ufRetorno;

  ClientesUfDropdown(this.ufRetorno);

  @override
  State<ClientesUfDropdown> createState() => _ClientesUfDropdownState();
}

class _ClientesUfDropdownState extends State<ClientesUfDropdown> {
  final ufController = TextEditingController();

  @override
  void initState() {
    ufController.text = 'AC';
    print('ufController.text em clientes_uf_dropdown --> ${ufController.text}');
    setState(() {
      widget.ufRetorno = (p0) {
        return 'AC';
      };
    });
    print('${widget.ufRetorno.toString()}');
    // ClienteUF? value;
    // print(widget.ufRetorno((value?.uf.toString().toUpperCase()) ?? "AC"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<ClienteUF>(
      initialSelection: ClienteUF.selecione,
      controller: ufController,
      onSelected: (ClienteUF? value) {
        setState(() {
          widget.ufRetorno((value?.uf.toString().toUpperCase()) ?? "AC");
        });
      },
      // requestFocusOnTap: true,
      menuHeight: Sizes.sizeH_200,
      width: Sizes.sizeW_170,
      enableSearch: false,
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

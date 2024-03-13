import 'package:flutter/material.dart';
import 'package:galle/app/core/sizes.dart';

import '../../../../../core/strings.dart';

enum ItemUM { un, gr }

class ItensUmDropdown extends StatefulWidget {
  const ItensUmDropdown({super.key});

  @override
  State<ItensUmDropdown> createState() => _ItensUmDropdownState();
}

class _ItensUmDropdownState extends State<ItensUmDropdown> {
  final umController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<ItemUM>(
      initialSelection: ItemUM.un,
      controller: umController,
      requestFocusOnTap: true,
      menuHeight: Sizes.sizeH_200,
      width: Sizes.sizeW_90,
      label: Text(Strings.um),
      dropdownMenuEntries:
          ItemUM.values.map<DropdownMenuEntry<ItemUM>>((ItemUM um) {
        return DropdownMenuEntry<ItemUM>(
          value: um,
          label: um.name,
        );
      }).toList(),
    );
  }
}

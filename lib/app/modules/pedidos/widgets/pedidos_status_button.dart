import 'package:flutter/material.dart';
import 'package:galle/app/core/font.dart';
import 'package:galle/app/core/space.dart';

import '../../../core/sizes.dart';
import '../../../core/strings.dart';

enum PedidoStatus { aberto, fechado, transmitido }

class PedidosStatusButton extends StatefulWidget {
  PedidosStatusButton({super.key});

  @override
  State<PedidosStatusButton> createState() => _PedidosStatusButtonState();
}

class _PedidosStatusButtonState extends State<PedidosStatusButton> {
  PedidoStatus? _PedidoStatus = PedidoStatus.aberto;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(Space.spacing_0),
          child: SizedBox(
            height: Sizes.sizeH_50,
            width: Sizes.sizeW_180,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.all(Space.spacing_0),
              title: const Text(
                Strings.aberto,
                style: TextStyle(
                  fontSize: Font.title_16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio<PedidoStatus>(
                value: PedidoStatus.aberto,
                groupValue: _PedidoStatus,
                onChanged: (PedidoStatus? value) {
                  setState(() {
                    _PedidoStatus = value;
                  });
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(Space.spacing_0),
          child: SizedBox(
            height: Sizes.sizeH_50,
            width: Sizes.sizeW_180,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.all(Space.spacing_0),
              title: const Text(
                Strings.fechado,
                style: TextStyle(
                  fontSize: Font.title_16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio<PedidoStatus>(
                value: PedidoStatus.fechado,
                groupValue: _PedidoStatus,
                onChanged: (PedidoStatus? value) {
                  setState(() {
                    _PedidoStatus = value;
                  });
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(Space.spacing_0),
          child: SizedBox(
            height: Sizes.sizeH_50,
            width: Sizes.sizeW_180,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.all(Space.spacing_0),
              title: const Text(
                Strings.transmitido,
                style: TextStyle(
                    fontSize: Font.title_16, fontWeight: FontWeight.bold),
              ),
              leading: Radio<PedidoStatus>(
                value: PedidoStatus.transmitido,
                groupValue: _PedidoStatus,
                onChanged: (PedidoStatus? value) {
                  setState(() {
                    _PedidoStatus = value;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

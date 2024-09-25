//* alterado em 24/09/24
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
  PedidoStatus? _pedidoStatus = PedidoStatus.aberto;

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
            width: Sizes.sizeW_200,
            child: ListTile(
              dense: true,
              contentPadding: const EdgeInsets.all(Space.spacing_0),
              title: Text(
                Strings.aberto,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 450
                      ? Font.title_24
                      : Font.title_16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio<PedidoStatus>(
                value: PedidoStatus.aberto,
                groupValue: _pedidoStatus,
                onChanged: (PedidoStatus? value) {
                  setState(() {
                    _pedidoStatus = value;
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
            width: Sizes.sizeW_200,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.all(Space.spacing_0),
              title: Text(
                Strings.fechado,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 450
                      ? Font.title_24
                      : Font.title_16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio<PedidoStatus>(
                value: PedidoStatus.fechado,
                groupValue: _pedidoStatus,
                onChanged: (PedidoStatus? value) {
                  setState(() {
                    _pedidoStatus = value;
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
            width: Sizes.sizeW_200,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.all(Space.spacing_0),
              title: Text(
                Strings.transmitido,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 450
                      ? Font.title_24
                      : Font.title_16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio<PedidoStatus>(
                value: PedidoStatus.transmitido,
                groupValue: _pedidoStatus,
                onChanged: (PedidoStatus? value) {
                  setState(() {
                    _pedidoStatus = value;
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

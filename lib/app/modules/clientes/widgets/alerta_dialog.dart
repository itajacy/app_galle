import 'package:flutter/material.dart';
import 'package:galle/app/modules/clientes/widgets/clientes_button.dart';

class AlertaDialog extends StatefulWidget {
  const AlertaDialog({super.key});

  @override
  State<AlertaDialog> createState() => _AlertaDialogState();
}

class _AlertaDialogState extends State<AlertaDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Welcome'), // To display the title it is optional
      content: const Text(
          'Confirma exclusão?'), // Message which will be pop up on the screen
      // Action widget which will provide the user to acknowledge the choice
      actions: [
        ClientesButton(
          onPress: () {},
          titulo: "SIM",
          icone: Icons.delete_forever,
        ),
        ClientesButton(
          onPress: () {},
          titulo: "NÃO",
          icone: Icons.not_interested_outlined,
        ),
      ],
    );
  }
}

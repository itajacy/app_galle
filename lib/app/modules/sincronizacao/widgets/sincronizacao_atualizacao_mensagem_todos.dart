// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/colors_app.dart';
import '../sincronizacao_dispositivo_controller.dart';

class SincronizacaoAtualizacaoMensagemTodos {
  BuildContext context;
  SincronizacaoDispositivoController sincronizacaoDispositivoController;

  SincronizacaoAtualizacaoMensagemTodos({
    required this.context,
    required this.sincronizacaoDispositivoController,
  });

  void showFullBottomSheet() async {
    sincronizacaoDispositivoController.totalDispositivo = 0;
    sincronizacaoDispositivoController.element = 0;

    // await sincronizacaoDispositivoController.sincronizacaoDispositivo(context);
    // await sincronizacaoCorController.sincronizacaoCor(context);
    showModalBottomSheet(
      isDismissible: false, // não deixa clicar fora
      enableDrag: false, // não deixa arrastar para fechar
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.9,
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                color: ColorsApp.screenBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 38, 77, 109),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Atualizando...',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        GetBuilder<SincronizacaoDispositivoController>(
                          builder: (_) {
                            return _buildProductCard(
                              'Dispositivo',
                              '0/10',
                              // '${sincronizacaoDispositivoController.element}/${sincronizacaoDispositivoController.totalDispositivo}',
                              'Atualizando Dispositivo',
                              Icons.person,
                            );
                          },
                        ),
                        // GetBuilder<SincronizacaoCorController>(
                        //   builder: (_) {
                        //     return _buildProductCard(
                        //       'Cor',
                        //       '${sincronizacaoCorController.element}/${sincronizacaoCorController.totalCores}',
                        //       'Atualizando Cores',
                        //       Icons.person,
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Fechar',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildProductCard(
      String title, String counters, String description, IconData icon) {
    return Card(
      color: ColorsApp.buttonMenuBackground,
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 32,
                color: ColorsApp.iconeForegroundLSecond,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    counters,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

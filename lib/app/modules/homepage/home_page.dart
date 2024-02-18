import 'package:flutter/material.dart';
import 'package:galle/app/modules/homepage/home_page_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black54,
      backgroundColor: Colors.grey.shade600,
      minimumSize: Size(180, 100),
      //padding: EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                /*
                HomePageButton(
                  onPress: () {
                    Navigator.of(context).pushNamed('/clientesPage');
                  },
                  titulo: 'CLIENTES',
                ),
                */
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/clientesPage');
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    'CLIENTES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/pedidosPage');
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    'PEDIDOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/precosPage');
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    'PREÇOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/catalogoPage');
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    'CATALOGO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/sincronizacaoPage');
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    'SINCRONIZAÇÃO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/configuracaoPage');
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    'CONFIGURAÇÃO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}




                    /*
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty<Size?>(Size(180, 100)),
                    //elevation: MaterialStatePropertyAll(20.0),
                    shadowColor: MaterialStatePropertyAll(Colors.blueGrey),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black87;
                      } else {
                        return Colors.blue.shade600;
                      }
                    }),
                  ),
                  */

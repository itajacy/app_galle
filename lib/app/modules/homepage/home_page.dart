import 'package:flutter/material.dart';
import 'package:galle/app/modules/homepage/home_page_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black54,
      backgroundColor: Colors.grey.shade600,
      minimumSize: const Size(150, 70),
      padding: EdgeInsets.all(2),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  child: Column(
                    children: [
                      Icon(
                        Icons.people_alt,
                        color: Colors.yellow,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'CLIENTES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/pedidosPage');
                  },
                  style: raisedButtonStyle,
                  child: Column(
                    children: [
                      Icon(
                        Icons.feed_rounded,
                        color: Colors.yellow,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'PEDIDOS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/precosPage');
                  },
                  style: raisedButtonStyle,
                  child: Column(
                    children: [
                      Icon(
                        Icons.monetization_on_rounded,
                        color: Colors.yellow,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'PREÇOS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/catalogoPage');
                  },
                  style: raisedButtonStyle,
                  child: Column(
                    children: [
                      Icon(
                        Icons.photo_camera_outlined,
                        color: Colors.yellow,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'CATÁLOGO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/sincronizacaoPage');
                  },
                  style: raisedButtonStyle,
                  child: Column(
                    children: [
                      Icon(
                        Icons.cached,
                        color: Colors.yellow,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'SINCRONIZAÇÃO',
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/configuracaoPage');
                  },
                  style: raisedButtonStyle,
                  child: Column(
                    children: [
                      Icon(
                        Icons.tune_rounded,
                        color: Colors.yellow,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'CONFIGURAÇÃO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
Icons.people_alt,
Icons.feed_rounded,
Icons.monetization_on_rounded,
Icons.photo_camera_outlined,
Icons.cached,
Icons.tune_rounded,

*/
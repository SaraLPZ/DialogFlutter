import 'package:curso_flutter/pages/pagina02.dart';
import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  bool _suscrito = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertDialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text(
                  "Suscribirme a este canal",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  mostrarAlerta(context);
                }),
            SizedBox(
              height: 100,
            ),
            Text(
              _suscrito ? "Suscrito" : "No suscrito",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  void mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(_suscrito ? "Cancelar Suscripcion" : "Sucribirse"),
        content: Text(_suscrito
            ? "¿Estas seguro de que quieres cancelar la suscripción?"
            : "¿Estas seguro de que quieres suscribirte?"),
        actions: [
          TextButton(
            child: Text("Cancelar"),
            onPressed: () {
              print("No");

              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text("Si quiero"),
            onPressed: () {
              print("Suscrito");
              setState(() {
                _suscrito = !_suscrito;
              });
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

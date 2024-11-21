import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Triangulo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrianguloState();
}

class TrianguloState extends State<Triangulo> {
  final TextEditingController _lado1 = TextEditingController();
  final TextEditingController _lado2 = TextEditingController();
  final TextEditingController _lado3 = TextEditingController();

  String resultado = "";

  void tipoTriangulo() {
    int lado1 = int.tryParse(_lado1.text) ?? 0;
    int lado2 = int.tryParse(_lado2.text) ?? 0;
    int lado3 = int.tryParse(_lado3.text) ?? 0;

    setState(() {
      if (_lado1.text.isEmpty || _lado2.text.isEmpty || _lado3.text.isEmpty) {
        resultado = "Todos los campos son obligatorios";
      } else {
        if (lado1 <= 0 || lado2 <= 0 || lado3 <= 0) {
          resultado = "Los lados deben ser mayores que cero";
        }
        if (lado1 == lado2 && lado2 == lado3) {
          resultado = "Equilátero";
        } else if (lado1 == lado2 || lado2 == lado3 || lado1 == lado3) {
          resultado = "Isósceles";
        } else {
          resultado = "Escaleno";
        }
      }
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Resultado del Triángulo"),
          content: Text(resultado),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tipo de Triangulo'.toUpperCase(),
          style: TextStyle(
            fontSize: 34,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _lado1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Ingrese el primer lado del triangulo:",
                ),
              ),
              TextField(
                controller: _lado2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Ingrese el segundo lado del triangulo:",
                ),
              ),
              TextField(
                controller: _lado3,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Ingrese el tercer lado del triangulo:",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: tipoTriangulo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 17, 33, 154),
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calculate),
                    SizedBox(width: 8),
                    Text("Calcular"),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

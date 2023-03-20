import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _EstadoDeMiApp createState() => _EstadoDeMiApp();
}

class _EstadoDeMiApp extends State<MyApp> {
  String _contrasena = '';

  bool _usarMayusculas = false;
  bool _usarMinusculas = false;
  bool _usarNumeros = false;
  bool _usarCaracteresEspeciales = false;

  void _generarContrasena() {
    String caracteres = '';

    if (_usarMayusculas) {
      caracteres += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    }

    if (_usarMinusculas) {
      caracteres += 'abcdefghijklmnopqrstuvwxyz';
    }

    if (_usarNumeros) {
      caracteres += '0123456789';
    }

    if (_usarCaracteresEspeciales) {
      caracteres += r'!@#$%^&*()_+~-=`{}[]|\:;"<>,.?/';
    }

    if (caracteres.isEmpty) {
      return;
    }

    String contrasena = '';
    final random = Random.secure();
    for (int i = 0; i < 16; i++) {
      contrasena += caracteres[random.nextInt(caracteres.length)];
    }

    setState(() {
      _contrasena = contrasena;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generador de Contrasenas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Generador de Contrasenas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _usarMayusculas,
                    onChanged: (value) {
                      setState(() {
                        _usarMayusculas = value!;
                      });
                    },
                  ),
                  Text('Mayúsculas'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _usarMinusculas,
                    onChanged: (value) {
                      setState(() {
                        _usarMinusculas = value!;
                      });
                    },
                  ),
                  Text('Minúsculas'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _usarNumeros,
                    onChanged: (value) {
                      setState(() {
                        _usarNumeros = value!;
                      });
                    },
                  ),
                  Text('Números'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _usarCaracteresEspeciales,
                    onChanged: (value) {
                      setState(() {
                        _usarCaracteresEspeciales = value!;
                      });
                    },
                  ),
                  Text('Caracteres especiales'),
                ],
              ),
              ElevatedButton(
                onPressed: _generarContrasena,
                child: Text('Generar Contraseña'),
              ),
              SizedBox(height: 16.0),
              Text(
                _contrasena.isEmpty
                    ? 'Tu contraseña aparecerá aquí'
                    : 'Tu contraseña es:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Text(
                _contrasena,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

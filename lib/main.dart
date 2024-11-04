import 'package:flutter/material.dart';
import 'screens/login_page.dart'; // Importa la pantalla de login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Muestra la pantalla de inicio de sesión
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthScreen(), // Cambia la pantalla inicial a AuthScreen
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Lista de usuarios simulada para prueba
  final List<Map<String, String>> _users = [
    {"email": "test@example.com", "password": "1234"}
  ];

  bool _isSignUp = false; // Alternar entre Login y Signup

  void _toggleSignUp() {
    setState(() {
      _isSignUp = !_isSignUp;
    });
  }

  void _authenticate() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (_isSignUp) {
      // Lógica para registro
      bool userExists = _users.any((user) => user['email'] == email);
      if (userExists) {
        _showMessage("El usuario ya existe");
      } else {
        _users.add({"email": email, "password": password});
        _showMessage("Registro exitoso. Inicia sesión.");
        _toggleSignUp();
      }
    } else {
      // Lógica para inicio de sesión
      bool validUser = _users.any((user) =>
          user['email'] == email && user['password'] == password);
      if (validUser) {
        _showMessage("Inicio de sesión exitoso");
      } else {
        _showMessage("Credenciales incorrectas");
      }
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSignUp ? 'Sign Up' : 'Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text(_isSignUp ? 'Sign Up' : 'Login'),
            ),
            TextButton(
              onPressed: _toggleSignUp,
              child: Text(_isSignUp
                  ? '¿Ya tienes una cuenta? Inicia sesión'
                  : '¿No tienes cuenta? Regístrate'),
            ),
          ],
        ),
      ),
    );
  }
}

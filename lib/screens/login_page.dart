import 'package:flutter/material.dart';
import '../theme/theme.dart'; // Importa el tema desde la carpeta de theme

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isSignUp = false;

  void _toggleSignUp() {
    setState(() {
      _isSignUp = !_isSignUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.loginBackground,
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isSignUp ? 'Regístrate' : 'Iniciar sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField(_emailController, 'Correo electrónico', false),
                SizedBox(height: 15),
                _buildTextField(_passwordController, 'Contraseña', true),
                SizedBox(height: 20),
                _buildAuthButton(),
                SizedBox(height: 10),
                TextButton(
                  onPressed: _toggleSignUp,
                  child: Text(
                    _isSignUp
                        ? '¿Ya tienes una cuenta? Inicia sesión'
                        : '¿No tienes cuenta? Regístrate',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText, bool obscureText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white24,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildAuthButton() {
  return ElevatedButton(
    onPressed: () {
      // Lógica de autenticación aquí
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.buttonColor, // Cambia a `backgroundColor`
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
    child: Text(
      _isSignUp ? 'Registrarse' : 'Iniciar sesión',
      style: const TextStyle(color: AppColors.loginGradientEnd, fontSize: 18),
    ),
  );
}

}

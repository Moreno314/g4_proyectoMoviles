import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';
  bool isLoggingIn = false;

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  void login() {
    final email = emailController.text;
    final password = passwordController.text;

    setState(() {
      isLoggingIn = true;
      errorMessage = '';
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoggingIn = false;
      });
      if (!isEmailValid(email)) {
        errorMessage = 'Correo electrónico no válido.';
      } else if (email == '12345@gmail.com' && password == '12345') {
        Navigator.pushNamed(context, '/home'); // Navegar a la página principal
      } else {
        if (email != '12345@gmail.com') {
          errorMessage = 'Usuario incorrecto.';
        } else if (password != '12345') {
          errorMessage = 'Contraseña incorrecta.';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenidos"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Usuario (correo electrónico)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ElevatedButton(
                onPressed: isLoggingIn ? null : login,
                child: isLoggingIn
                    ? CircularProgressIndicator()
                    : Text("Ingresar"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acerca del sitio"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Bienvenido a nuestra aplicación",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Descripción de la aplicación:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "En nuestro aplicativo, te ofrecemos una amplia variedad de preguntas para ayudarte a prepararte mejor para tus prácticas calificadas y exámenes parciales durante todo el ciclo escolar. Nuestra misión es proporcionarte las herramientas necesarias para que puedas tener éxito en tus estudios y alcanzar tus metas académicas de manera eficaz.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              "Características destacadas:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: <Widget>[
                _buildFeature("Amplia colección de preguntas y ejercicios"),
                _buildFeature("Seguimiento de tu progreso y resultados"),
                _buildFeature("Interfaz de usuario moderna y fácil de usar"),
                _buildFeature("Recursos educativos actualizados"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.check, color: Colors.green),
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

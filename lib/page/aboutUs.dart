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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bienvenido a nuestra aplicación",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Descripción de la aplicación:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "En nuestro aplicativo, te ofrecemos una amplia variedad de preguntas para ayudarte a prepararte mejor para tus prácticas calificadas y exámenes parciales durante todo el ciclo escolar. Nuestra misión es proporcionarte las herramientas necesarias para que puedas tener éxito en tus estudios y alcanzar tus metas académicas de manera eficaz.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Características destacadas:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text("Amplia colección de preguntas y ejercicios"),
                ),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text("Seguimiento de tu progreso y resultados"),
                ),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text("Interfaz de usuario moderna y fácil de usar"),
                ),
                ListTile(
                  leading: Icon(Icons.check),
                  title: Text("Recursos educativos actualizados"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

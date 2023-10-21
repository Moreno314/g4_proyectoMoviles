import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  Widget buildMemberInfo(String name, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contactanos"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Somos el Grupo 4",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Un equipo de estudiantes apasionados por la Ingeniería de Sistemas de la Universidad San Marcos.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Integrantes:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            buildMemberInfo("Alejandro Moreno",
                "Experta en desarrollo web, amante de la innovación tecnológica y resolución de problemas."),
            buildMemberInfo("Shamyr Mantilla",
                "Especialista en análisis de datos, comprometido con la eficiencia y la calidad en el trabajo."),
            buildMemberInfo("Jean Paul Huaman",
                "Gurú de la ciberseguridad, siempre preocupada por la privacidad y la seguridad en línea."),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("InfoQuiz")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ven a visitar InfoQuiz el banco de preguntas de examenes de la FISI",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "En nuestro aplicativo podras encontrar una cantidad inmensa de preguntas para que puedas afrontar de mejor manera tus practicas calificadas y tus examenes parciales del ciclo",
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text("Ingresar"),
              ),
              const SizedBox(height: 20),
              const Text(
                "¿Quiénes lo conforman?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 10),
              _buildRoleRow(
                icon: Icons.person,
                title: "Estudiantes",
                description:
                    "Desde el primer hasta el décimo ciclo de la facultad de Ingeniería de Sistemas e Informática.",
              ),
              const SizedBox(height: 20),
              _buildRoleRow(
                icon: Icons.school,
                title: "Docentes",
                description:
                    "Profesores que ejercen la función de enseñanza en la facultad, contratados, auxiliares y nombrados.",
              ),
              const SizedBox(height: 20),
              _buildRoleRow(
                icon: Icons.person,
                title: "Egresados",
                description:
                    "Personas que han completado sus estudios en la facultad.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleRow({IconData? icon, String? title, String? description}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description!,
              ),
            ],
          ),
        ),
        Icon(
          icon,
          size: 100,
          color: Colors.blue,
        ),
      ],
    );
  }
}

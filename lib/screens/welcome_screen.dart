import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RepoFisi")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ven a visitar el repositorio de la Facultad de Sistemas e Informática. ¡Colabora, investiga y publica!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "En nuestro repositorio podrás encontrar una gran cantidad de proyectos de diferentes tipos. Únete a nosotros y encuentra lo que estás buscando.",
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

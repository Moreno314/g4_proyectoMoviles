import 'package:flutter/material.dart';
import 'package:parcial_grupo4/admin/categoryDetails.dart';
import 'package:parcial_grupo4/admin/postDetails.dart';
import 'package:parcial_grupo4/main.dart';
import 'package:parcial_grupo4/page/Login.dart';

class Dashboard extends StatefulWidget {
  final name;
  final username;
  Dashboard({this.name = "Guest", this.username = ""});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Widget menuDrawer() {
      return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person),
                ),
              ),
              accountName: Text(widget.name),
              accountEmail: Text(widget.username),
            ),
            ListTile(
              onTap: () {
                debugPrint("Home");
              },
              leading: Icon(
                Icons.home,
                color: Colors.green,
              ),
              title: Text(
                'Inicio',
                style: TextStyle(color: Colors.green),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryDetails(),
                  ),
                );
                debugPrint("Gestionar Cursos");
              },
              leading: Icon(
                Icons.school,
                color: Colors.blue,
              ),
              title: Text(
                'Gestionar Cursos',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetails(),
                  ),
                );
                debugPrint("Administrar Publicaciones");
              },
              leading: Icon(
                Icons.library_books,
                color: Colors.orange,
              ),
              title: Text(
                'Administrar Publicaciones',
                style: TextStyle(color: Colors.orange),
              ),
            ),
            ListTile(
              onTap: () {
                // Simulación de una función genérica
                debugPrint("Administrar Alumnos");
              },
              leading: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              title: Text(
                'Administrar Alumnos',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
            ListTile(
              onTap: () {
                // Simulación de una función genérica
                debugPrint("Reportes");
              },
              leading: Icon(
                Icons.insert_chart,
                color: Colors.red,
              ),
              title: Text(
                'Generar Reportes',
                style: TextStyle(color: Colors.red),
              ),
            ),
            widget.name == "Guest"
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                      debugPrint("Login");
                    },
                    leading: Icon(
                      Icons.lock,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Iniciar Sesión',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                      debugPrint("Cerrar Sesión");
                    },
                    leading: Icon(
                      Icons.lock_open,
                      color: Colors.blue,
                    ),
                    title: Text(
                      'Cerrar Sesión',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: menuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido Administrador',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Aquí podrás administrar los elementos relacionados con la facultad de ingeniería de sistemas.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            _buildFunctionCard(
              title: 'Gestionar Cursos',
              description: 'Agrega, edita o elimina cursos disponibles.',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryDetails(),
                  ),
                );
              },
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            _buildFunctionCard(
              title: 'Administrar Publicaciones',
              description:
                  'Administra publicaciones, preguntas y contenido relacionado con los cursos.',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetails(),
                  ),
                );
              },
              color: Colors.orange,
            ),
            // Otras funciones simuladas
            _buildFunctionCard(
              title: 'Administrar Alumnos',
              description: 'Gestiona la información de los estudiantes.',
              onPressed: () {
                debugPrint("Administrar Alumnos");
              },
              color: Colors.deepPurple,
            ),
            _buildFunctionCard(
              title: 'Analisis de sentimientos',
              description: 'Obtén las conclusiones por cada pregunta',
              onPressed: () {
                debugPrint("Reportes");
              },
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFunctionCard({
    required String title,
    required String description,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        onTap: onPressed,
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(Icons.star, color: Colors.white),
        ),
      ),
    );
  }
}

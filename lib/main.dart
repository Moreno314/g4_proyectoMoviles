import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parcial_grupo4/components/CategoryListItem.dart';
import 'package:parcial_grupo4/components/RecentPostItem.dart';
import 'package:parcial_grupo4/components/TopPostCard.dart';
import 'package:parcial_grupo4/screens/welcome_screen.dart';
import 'package:parcial_grupo4/screens/login.dart';
import 'package:parcial_grupo4/screens/splash_screen.dart'; // Importa el splash screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash', // Ruta inicial, muestra el splash screen
      routes: {
        '/splash': (context) => SplashScreen(), // Ruta para el splash screen
        '/welcome': (context) =>
            WelcomeScreen(), // Ruta para la pantalla de bienvenida
        '/home': (context) => MyHomePage(), // Ruta para la página principal
        '/login': (context) =>
            LoginScreen(), // Ruta para la pantalla de inicio de sesión
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var curdate = DateFormat("d MMMM y").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: <Widget>[
          Container(
            width: 150,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 180,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.pexels.com/photos/1831234/pexels-photo-1831234.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Grupo 4 - Sistemas Móviles",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "grupo4@gmail.com",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              ListTile(
                leading: const Icon(Icons.home, size: 32.0),
                title: const Text(
                  "Home",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.business, size: 32.0),
                title: const Text(
                  "Proyectos",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.chat, size: 32.0),
                title: const Text(
                  "Discusiones",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.forum, size: 32.0),
                title: const Text(
                  "Foro",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const Divider(
                color: Colors.blue,
                thickness: 2,
              ),
              ListTile(
                leading: const Icon(Icons.folder, size: 32.0),
                title: const Text(
                  "Recursos",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              ExpansionTile(
                leading: const Icon(Icons.folder, size: 32.0),
                title: const Text(
                  "Tus proyectos",
                  style: TextStyle(fontSize: 18.0),
                ),
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            "Favoritos",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            "Todos",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Preguntas del día',
              style: TextStyle(fontSize: 25, fontFamily: 'OpenSans'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  curdate,
                  style: TextStyle(
                      fontSize: 18, fontFamily: 'OpenSans', color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.today,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
          TopPostCard(), // Asegúrate de que TopPostCard tenga scrollDirection: Axis.horizontal
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Text(
                'Cursos más vistos',
                style: TextStyle(fontSize: 25, fontFamily: 'OpenSans'),
              ),
            ),
          ),
          CategoryListItem(),

          RecentPostItem(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parcial_grupo4/components/CategoryListItem.dart';
import 'package:parcial_grupo4/components/RecentPostItem.dart';
import 'package:parcial_grupo4/components/TopPostCard.dart';
import 'package:parcial_grupo4/page/ContactUs.dart';
import 'package:parcial_grupo4/page/Login.dart';
import 'package:parcial_grupo4/page/aboutUS.dart';
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
  final name;
  final email;
  MyHomePage({this.name = "Guest", this.email = ""});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var curdate = DateFormat("d MMMM y").format(DateTime.now());

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
              accountEmail: Text(widget.email),
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
                'Home',
                style: TextStyle(color: Colors.green),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUs(),
                  ),
                );
                debugPrint("Acerca del sitio");
              },
              leading: Icon(
                Icons.label,
                color: Colors.grey,
              ),
              title: Text(
                'Acerca del sitio',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUs(),
                  ),
                );
                debugPrint("Contactanos");
              },
              leading: Icon(
                Icons.contacts,
                color: Colors.amber,
              ),
              title: Text(
                'Contactanos',
                style: TextStyle(color: Colors.amber),
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
                      'Login',
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
                      debugPrint("Login");
                    },
                    leading: Icon(
                      Icons.lock_open,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
          ],
        ),
      );
    }

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
      drawer: menuDrawer(),
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

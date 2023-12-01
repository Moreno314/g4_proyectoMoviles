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
import 'package:parcial_grupo4/screens/splash_screen.dart';

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
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/home': (context) => MyHomePage(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final name;
  final email;

  MyHomePage({this.name = "Guest", this.email = "ejemplo@gmail.com"});

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
            width: 200,
            height: 40,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
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
                color: Colors.lightBlue,
              ),
              title: Text(
                'Contactanos',
                style: TextStyle(color: Colors.lightBlue),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  curdate,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.today,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          TopPostCard(
            userEmail: widget.email,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Cursos más vistos',
              style: TextStyle(fontSize: 25, fontFamily: 'OpenSans'),
            ),
          ),
          CategoryListItem(),
          RecentPostItem(),
        ],
      ),
    );
  }
}

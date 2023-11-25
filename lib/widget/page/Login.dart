import 'package:flutter/material.dart';
import 'package:parcial_grupo4/widget/admin/Dashboard.dart';
import 'package:parcial_grupo4/main.dart';
import 'package:parcial_grupo4/widget/page/Signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    try {
      var url = Uri.parse("http://192.168.0.4/g4_avance/login.php");
      var response = await http
          .post(url, body: {"username": user.text, "password": pass.text});
      if (response.statusCode == 200) {
        var userData = json.decode(response.body);
        if (userData == "ERROR") {
          showDialog(
            context: (context),
            builder: (context) => AlertDialog(
              title: Text("Mensaje"),
              content: Text("Credenciales invalidas"),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                )
              ],
            ),
          );
        } else {
          if (userData['status'] == "Admin") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(
                  name: userData['name'],
                  username: userData['username'],
                ),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(
                  name: userData['name'],
                  email: userData['username'],
                ),
              ),
            );
          }
          showDialog(
            context: (context),
            builder: (context) => AlertDialog(
              title: Text("Mensaje"),
              content: Text("Login Successful"),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                )
              ],
            ),
          );
          print(userData);
        }
      } else {
        print("Error en la solicitud HTTP: ${response.statusCode}");
      }
    } catch (e) {
      print("Error en la solicitud HTTP: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Positioned(
            top: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login Here",
                style: TextStyle(fontFamily: 'OpenSans', fontSize: 30),
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: user,
                  decoration: InputDecoration(labelText: "Usuario"),
                ),
              ),
            ),
          ),
          Positioned(
            top: 270,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: pass,
                  decoration: InputDecoration(labelText: "Contraseña"),
                ),
              ),
            ),
          ),
          Positioned(
              top: 350,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.pink,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      login();
                    },
                  ),
                ),
              )),
          Positioned(
              top: 420,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "O Registrate",
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
              )),
          Positioned(
              top: 480,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text(
                        "Click aqui para Registrarte",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup(),
                          ),
                        );
                        debugPrint("Clikeado");
                      },
                    )),
              )),
        ],
      ),
    );
  }
}

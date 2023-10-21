import 'package:flutter/material.dart';
import 'package:parcial_grupo4/admin/Dashboard.dart';
import 'package:parcial_grupo4/main.dart';
import 'package:parcial_grupo4/page/Login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();

  Future signUp() async {
    try {
      var url = Uri.parse("http://192.168.0.10/g4_avance/register.php");
      var response = await http.post(url, body: {
        "username": user.text,
        "password": pass.text,
        "name": name.text
      });
      if (response.statusCode == 200) {
        var userData = json.decode(response.body);
        if (userData == "ERROR") {
          showDialog(
            context: (context),
            builder: (context) => AlertDialog(
              title: Text("Mensaje"),
              content: Text("Este usuario ya existe"),
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
                builder: (context) => Dashboard(),
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
              content: Text("Signup Successful"),
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
        title: Text("SignUp"),
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
                "Sign up aqui",
                style: TextStyle(fontFamily: 'OpenSans', fontSize: 30),
              ),
            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(labelText: "Nombre"),
                ),
              ),
            ),
          ),
          Positioned(
            top: 230,
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
            top: 310,
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
              top: 380,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.pink,
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      signUp();
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
                    "O Ingresa",
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
                        "Click aqui para Ingresar",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
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

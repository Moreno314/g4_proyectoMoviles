import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Login.dart';

class PostDetails extends StatefulWidget {
  final id;
  final imagen;
  final autor;
  final post_date;
  final titulo;
  final cuerpo;
  final userEmail;

  PostDetails(
      {this.id,
      this.userEmail = "ejemplo@gmail.com",
      this.imagen,
      this.autor,
      this.post_date,
      this.titulo,
      this.cuerpo});

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    TextEditingController commentsController = TextEditingController();

    Future AddComments() async {
      var url = Uri.parse("http://192.168.0.11/g4_avance/addComments.php");
      var response = await http.post(url, body: {
        "comment": commentsController.text,
        "user_email": widget.userEmail,
        "post_id": widget.id.toString(),
      });
      if (response.statusCode == 200) {
        showDialog(
          context: (context),
          builder: (context) => AlertDialog(
            title: Text("Mensaje"),
            content: Text("Comentario Add Succesful"),
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
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles de la pregunta"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.titulo,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.imagen,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.cuerpo == null ? "" : widget.cuerpo,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Por " + widget.autor,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Publicado el " + widget.post_date,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Area de comentarios",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onSubmitted: (value) {
                        commentsController.text = value;
                      },
                      onChanged: (value) {
                        print("User Email: ${widget.userEmail}");
                        if (widget.userEmail == "") {
                          showDialog(
                            context: (context),
                            builder: (context) => AlertDialog(
                              title: Text("Mensaje"),
                              content: Text("Inicia sesión para comentar"),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ),
                                    );
                                  },
                                  child: Text("Login"),
                                )
                              ],
                            ),
                          );
                        }
                      },
                      controller: commentsController,
                      decoration: InputDecoration(labelText: "Enter"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      child: Text(
                        "Publicar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        AddComments();
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

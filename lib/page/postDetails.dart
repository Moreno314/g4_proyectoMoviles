import 'package:flutter/material.dart';
//import 'package:http/http.dart';

class PostDetails extends StatelessWidget {
  final imagen;
  final autor;
  final post_date;
  final titulo;
  final cuerpo;

  PostDetails(
      {this.imagen, this.autor, this.post_date, this.titulo, this.cuerpo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles de la pregunta"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                titulo,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Image.network(
                imagen,
                height: 250,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cuerpo,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Por " + autor,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Publicado el " + post_date,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Area de comentarios",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans'),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration:
                          InputDecoration(labelText: 'Ingresa comentario'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      child: Text(
                        'Publica',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

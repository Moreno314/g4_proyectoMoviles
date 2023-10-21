import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:parcial_grupo4/page/postDetails.dart';

class RecentPostItem extends StatefulWidget {
  @override
  _RecentPostItemState createState() => _RecentPostItemState();
}

class _RecentPostItemState extends State<RecentPostItem> {
  List<dynamic> recentPost = [];

  Future recentPostData() async {
    try {
      var url = Uri.parse("http://192.168.0.10/g4_avance/postAll.php");
      var response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          recentPost = jsonData;
        });
        print(jsonData);
        return jsonData;
      } else {
        print("Error en la solicitud HTTP: ${response.statusCode}");
      }
    } catch (e) {
      print("Error en la solicitud HTTP: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recentPostData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: recentPost.length,
        itemBuilder: (context, index) {
          return RecentItem(
            titulo: recentPost[index]['titulo'],
            autor: recentPost[index]['autor'],
            date: recentPost[index]['create_date'],
            cuerpo: recentPost[index]['cuerpo'],
            imagen:
                'https://media.istockphoto.com/id/636332456/es/foto/concepto-de-educaci%C3%B3n-en-l%C3%ADnea.jpg?s=2048x2048&w=is&k=20&c=QvENnRD__o7HfImDdKYsYWLiYUcoWNH9iEByQx-kOZk=',
          );
        },
      ),
    );
  }
}

class RecentItem extends StatefulWidget {
  final titulo;
  final imagen;
  final autor;
  final date;
  final cuerpo;
  RecentItem({this.titulo, this.imagen, this.autor, this.date, this.cuerpo});

  @override
  _RecentItemState createState() => _RecentItemState();
}

class _RecentItemState extends State<RecentItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetails(
                        imagen: widget.imagen,
                        autor: widget.autor,
                        titulo: widget.titulo,
                        post_date: widget.date,
                        cuerpo: widget.cuerpo,
                      ),
                    ),
                  );
                  debugPrint(widget.titulo);
                },
                child: Text(
                  widget.titulo,
                  style: TextStyle(fontSize: 20, fontFamily: 'OpenSans'),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Por: ' + widget.autor,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' publicado el : ' + widget.date,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Image.network(
            widget.imagen,
            height: 70,
            width: 70,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:parcial_grupo4/page/postDetails.dart';

class TopPostCard extends StatefulWidget {
  final userEmail;
  TopPostCard({this.userEmail});
  @override
  _TopPostCardState createState() => _TopPostCardState();
}

class _TopPostCardState extends State<TopPostCard> {
  List<dynamic> postData = [];

  Future<void> showAllPost() async {
    try {
      var url = Uri.parse("http://192.168.0.11/g4_avance/postAll.php");
      var response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          postData = jsonData;
        });
      } else {
        print("Error en la solicitud HTTP: ${response.statusCode}");
      }
    } catch (e) {
      print("Error en la solicitud HTTP: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    print("TopPostCard userEmail: ${widget.userEmail}");
    showAllPost();
  }

  @override
  Widget build(BuildContext context) {
    print("TopPostCard userEmail: ${widget.userEmail}");
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: postData.map((post) {
            return NewPostItem(
              id: post['id'],
              autor: post['autor'],
              cuerpo: post['cuerpo'],
              nombre_curso: post['nombre_curso'],
              comentarios: post['comentarios'],
              imagen:
                  'https://media.istockphoto.com/id/636332456/es/foto/concepto-de-educaci%C3%B3n-en-l%C3%ADnea.jpg?s=2048x2048&w=is&k=20&c=QvENnRD__o7HfImDdKYsYWLiYUcoWNH9iEByQx-kOZk=',
              post_date: post['post_date'],
              total_like: post['total_like'],
              create_date: post['create_date'],
              titulo: post['titulo'],
              userEmail: widget.userEmail,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class NewPostItem extends StatefulWidget {
  final String id;
  final String imagen;
  final String autor;
  final String post_date;
  final String comentarios;
  final String total_like;
  final String titulo;
  final String cuerpo;
  final String nombre_curso;
  final String create_date;
  final String userEmail;

  NewPostItem(
      {required this.id,
      required this.imagen,
      required this.autor,
      required this.post_date,
      required this.comentarios,
      required this.total_like,
      required this.titulo,
      required this.cuerpo,
      required this.nombre_curso,
      required this.create_date,
      required this.userEmail});
  @override
  _NewPostItemState createState() => _NewPostItemState();
}

class _NewPostItemState extends State<NewPostItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(widget.imagen),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.autor,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.post_date,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            widget.titulo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Icon(Icons.comment),
                  SizedBox(width: 5),
                  Text(widget.comentarios),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.favorite),
                  SizedBox(width: 5),
                  Text(widget.total_like),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetails(
                    id: widget.id,
                    titulo: widget.titulo,
                    imagen: widget.imagen,
                    autor: widget.autor,
                    cuerpo: widget.cuerpo,
                    post_date: widget.post_date,
                    userEmail: widget.userEmail,
                  ),
                ),
              );
            },
            child: Text('Read More'),
          ),
        ],
      ),
    );
  }
}

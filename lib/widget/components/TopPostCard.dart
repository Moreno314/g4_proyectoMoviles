import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:parcial_grupo4/models/post_model.dart';
import 'package:parcial_grupo4/widget/page/postDetails.dart';

class TopPostCard extends StatefulWidget {
  @override
  _TopPostCardState createState() => _TopPostCardState();
}

class _TopPostCardState extends State<TopPostCard> {
  List<NewPostItem> postData = [];

  Future<void> showAllPost() async {
    try {
      var url = Uri.parse("http://192.168.0.4/g4_avance/postAll.php");
      var response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          postData = (jsonData as List)
              .map((post) => NewPostItem(
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
                  ))
              .toList();
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
    showAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: postData.map((post) {
            return NewPostWidget(post: post);
          }).toList(),
        ),
      ),
    );
  }
}

class NewPostWidget extends StatelessWidget {
  final NewPostItem post;

  NewPostWidget({required this.post});

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
            offset: Offset(0, 3),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Contenido del post usando los datos de NewPostItem
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(post.imagen),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.autor,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    post.post_date,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            post.titulo,
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
                  Text(post.comentarios),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.favorite),
                  SizedBox(width: 5),
                  Text(post.total_like),
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
                    titulo: post.titulo,
                    imagen: post.imagen,
                    autor: post.autor,
                    cuerpo: post.cuerpo,
                    post_date: post.post_date,
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

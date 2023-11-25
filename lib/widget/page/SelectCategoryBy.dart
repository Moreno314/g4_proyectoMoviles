import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parcial_grupo4/models/post_model.dart';
import 'dart:convert';

import 'package:parcial_grupo4/widget/page/postDetails.dart';
// Reemplaza 'nombre_de_tu_proyecto'

class SelectCategoryBy extends StatefulWidget {
  final categoryName;
  SelectCategoryBy({this.categoryName});
  @override
  _SelectCategoryByState createState() => _SelectCategoryByState();
}

class _SelectCategoryByState extends State<SelectCategoryBy> {
  List<NewPostItem> categoryByPost = [];

  Future categoryByData() async {
    try {
      var url = Uri.parse("http://192.168.0.4/g4_avance/categoryByPost.php");
      var response = await http.post(url, body: {'name': widget.categoryName});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          categoryByPost = (jsonData as List)
              .map((post) => NewPostItem(
                    imagen:
                        'https://media.istockphoto.com/id/636332456/es/foto/concepto-de-educaci%C3%B3n-en-l%C3%ADnea.jpg?s=2048x2048&w=is&k=20&c=QvENnRD__o7HfImDdKYsYWLiYUcoWNH9iEByQx-kOZk=',
                    autor: post['autor'],
                    post_date: post['post_date'],
                    comentarios: post['comentarios'],
                    total_like: post['total_like'],
                    titulo: post['titulo'],
                    cuerpo: post['cuerpo'],
                    nombre_curso: post['nombre_curso'],
                    create_date: post['create_date'],
                  ))
              .toList();
        });
        print(jsonData);
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
    categoryByData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: categoryByPost.length,
          itemBuilder: (context, index) {
            return NewPostItemWidget(post: categoryByPost[index]);
          },
        ),
      ),
    );
  }
}

class NewPostItemWidget extends StatelessWidget {
  final NewPostItem post;

  NewPostItemWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(post.imagen),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(post.imagen),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 70,
                  child: Text(
                    post.autor,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 210,
                  child: Text(
                    post.post_date,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 90,
                  child: Icon(
                    Icons.comment,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 130,
                  child: Text(
                    post.comentarios,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 160,
                  child: Icon(
                    Icons.label,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 190,
                  child: Text(
                    post.total_like,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.titulo,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    child: Text(
                      "Read More",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    onTap: () {
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
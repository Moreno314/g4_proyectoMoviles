import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:parcial_grupo4/page/postDetails.dart';

class SelectCategoryBy extends StatefulWidget {
  final categoryName;
  SelectCategoryBy({this.categoryName});
  @override
  _SelectCategoryByState createState() => _SelectCategoryByState();
}

class _SelectCategoryByState extends State<SelectCategoryBy> {
  List<dynamic> categoryByPost = [];

  Future categoryByData() async {
    try {
      //var url = Uri.parse("http://192.168.0.10/g4_avance/CategoryAll.php");
      var url = Uri.parse("http://192.168.0.11/g4_avance/categoryByPost.php");
      var response = await http.post(url, body: {'name': widget.categoryName});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          categoryByPost = jsonData;
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
              return NewPostItem(
                autor: categoryByPost[index]['autor'],
                cuerpo: categoryByPost[index]['cuerpo'],
                nombre_curso: categoryByPost[index]['nombre_curso'],
                comentarios: categoryByPost[index]['comentarios'],
                imagen:
                    'https://media.istockphoto.com/id/636332456/es/foto/concepto-de-educaci%C3%B3n-en-l%C3%ADnea.jpg?s=2048x2048&w=is&k=20&c=QvENnRD__o7HfImDdKYsYWLiYUcoWNH9iEByQx-kOZk=',
                post_date: categoryByPost[index]['post_date'],
                total_like: categoryByPost[index]['total_like'],
                create_date: categoryByPost[index]['create_date'],
                titulo: categoryByPost[index]['titulo'],
              );
            }),
      ),
    );
  }
}

class NewPostItem extends StatefulWidget {
  final imagen;
  final autor;
  final post_date;
  final comentarios;
  final total_like;
  final titulo;
  final cuerpo;
  final nombre_curso;
  final create_date;

  NewPostItem(
      {this.imagen,
      this.autor,
      this.post_date,
      this.comentarios,
      this.total_like,
      this.titulo,
      this.cuerpo,
      this.nombre_curso,
      this.create_date});

  @override
  _NewPostItemState createState() => _NewPostItemState();
}

class _NewPostItemState extends State<NewPostItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.grey]),
            ),
            //color: Colors.amber,
          ),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: CircleAvatar(
            radius: 20,
            //child: Icon(Icons.person),
            backgroundImage: NetworkImage(widget.imagen),
          ),
        ),
        Positioned(
            top: 30,
            left: 80,
            child: Text(
              widget.autor,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            )),
        Positioned(
            top: 30,
            left: 220,
            child: Text(
              widget.post_date,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            )),
        Positioned(
          top: 50,
          left: 100,
          child: Icon(
            Icons.comment,
            color: Colors.white,
          ),
        ),
        Positioned(
            top: 50,
            left: 140,
            child: Text(
              widget.comentarios,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            )),
        Positioned(
          top: 50,
          left: 170,
          child: Icon(
            Icons.label,
            color: Colors.white,
          ),
        ),
        Positioned(
            top: 50,
            left: 200,
            child: Text(
              widget.total_like,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            )),
        Positioned(
            top: 100,
            left: 30,
            child: Text(
              widget.titulo,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            )),
        Positioned(
            top: 146,
            left: 30,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        Positioned(
            top: 150,
            left: 60,
            child: InkWell(
              child: Text(
                "Read More",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetails(
                      titulo: widget.titulo,
                      imagen: widget.imagen,
                      autor: widget.autor,
                      cuerpo: widget.cuerpo,
                      post_date: widget.post_date,
                    ),
                  ),
                );
              },
            )),
      ],
    );
  }
}

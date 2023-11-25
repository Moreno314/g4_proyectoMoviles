import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:parcial_grupo4/models/recent_post_model.dart';

import 'package:parcial_grupo4/widget/page/postDetails.dart';
// Asegúrate de cambiar 'nombre_de_tu_proyecto'

class RecentPostItem extends StatefulWidget {
  @override
  _RecentPostItemState createState() => _RecentPostItemState();
}

class _RecentPostItemState extends State<RecentPostItem> {
  List<RecentPostItemModel> recentPost = [];

  Future<void> recentPostData() async {
    try {
      var url = Uri.parse("http://192.168.0.4/g4_avance/postAll.php");
      var response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          recentPost = (jsonData as List)
              .map((post) => RecentPostItemModel(
                    titulo: post['titulo'],
                    autor: post['autor'],
                    date: post['create_date'],
                    cuerpo: post['cuerpo'],
                    imagen:
                        'https://media.istockphoto.com/id/636332456/es/foto/concepto-de-educaci%C3%B3n-en-l%C3%ADnea.jpg?s=2048x2048&w=is&k=20&c=QvENnRD__o7HfImDdKYsYWLiYUcoWNH9iEByQx-kOZk=',
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
            post: recentPost[index],
          );
        },
      ),
    );
  }
}

class RecentItem extends StatelessWidget {
  final RecentPostItemModel post;

  RecentItem({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetails(
                imagen: post.imagen,
                autor: post.autor,
                titulo: post.titulo,
                post_date: post.date,
                cuerpo: post.cuerpo,
              ),
            ),
          );
          debugPrint(post.titulo);
        },
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post.titulo,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: <Widget>[
                          Text(
                            'Por: ' + post.autor,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            ' Publicado el: ' + post.date,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Image.network(
                      post.imagen,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

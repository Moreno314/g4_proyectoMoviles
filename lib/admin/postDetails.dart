import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:parcial_grupo4/admin/addEditPost.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  List<dynamic> post = [];

  Future getAllPost() async {
    try {
      var url = Uri.parse("http://192.168.0.10/g4_avance/postAll.php");
      var response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          post = jsonData;
        });
        //print(jsonData);
        //return jsonData;
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
    getAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de preguntas'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditPost(),
                ),
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: post.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEditPost(
                          postList: post,
                          index: index,
                        ),
                      ),
                    );
                  },
                ),
                title: Text(post[index]['titulo']),
                subtitle: Text(
                  post[index]['cuerpo'],
                  maxLines: 2,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
              ),
            );
          }),
    );
  }
}

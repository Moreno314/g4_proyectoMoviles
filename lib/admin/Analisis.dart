import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//http://192.168.0.11/g4_avance/commentsAll.php
class Analisis extends StatefulWidget {
  const Analisis({Key? key}) : super(key: key);

  @override
  _AnalisisState createState() => _AnalisisState();
}

class _AnalisisState extends State<Analisis> {
  List<Map<String, dynamic>> comments = [];

  Future<void> fetchComments() async {
    try {
      var url = Uri.parse("http://192.168.0.11/g4_avance/commentsAll.php");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          List<dynamic> jsonData = json.decode(response.body);

          // Agrupar comentarios por post_id
          Map<int, List<String>> groupedComments = {};

          jsonData.forEach((comment) {
            int postId = int.parse(comment['post_id'].toString());
            String commentText = comment['comment'].toString();

            if (groupedComments.containsKey(postId)) {
              groupedComments[postId]!.add(commentText);
            } else {
              groupedComments[postId] = [commentText];
            }
          });

          // Convertir el resultado a la estructura deseada
          comments = groupedComments.entries.map((entry) {
            return {
              'post_id': entry.key,
              'comments': entry.value,
            };
          }).toList();
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
    fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comentarios de la BD'),
      ),
      body: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return CommentCard(
            postId: comments[index]['post_id'],
            comments: comments[index]['comments'],
          );
        },
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final int postId;
  final List<String> comments;

  CommentCard({required this.postId, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID de la Pregunta: $postId',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: comments.map((comment) {
                return Text(
                  'Comentario: $comment',
                  style: TextStyle(fontSize: 16),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

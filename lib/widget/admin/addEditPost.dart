import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddEditPost extends StatefulWidget {
  final postList;
  final index;
  AddEditPost({this.postList, this.index});

  @override
  _AddEditPostState createState() => _AddEditPostState();
}

class _AddEditPostState extends State<AddEditPost> {
  Object? selectedCategory;
  List<dynamic> categoryItem = [];

  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  bool editMode = false;

  Future addEditPost() async {
    var url = Uri.parse("http://192.168.0.10/g4_avance/addPost.php");
    var request = http.MultipartRequest("POST", url);
    request.fields['title'] = title.text;
    request.fields['body'] = body.text;
    request.fields['category_name'] = selectedCategory.toString();

    var response = await request.send();
    if (response.statusCode == 200) {
      print(title.text);
    }
  }

  Future getAllCategory() async {
    try {
      var url = Uri.parse("http://192.168.0.10/g4_avance/CategoryAll.php");
      var response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          categoryItem = jsonData;
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
    getAllCategory();
    if (widget.index != null) {
      editMode = true;
      title.text = widget.postList[widget.index]['titulo'];
      body.text = widget.postList[widget.index]['cuerpo'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editMode ? 'Actualizar' : 'Añade una pregunta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: title,
              decoration: InputDecoration(
                labelText: 'Título de la pregunta',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: body,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Descripción de la pregunta',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            DropdownButton(
              isExpanded: true,
              value: selectedCategory,
              hint: Text('Selecciona una categoría'),
              items: categoryItem.map((category) {
                return DropdownMenuItem(
                  value: category['name'],
                  child: Text(category['name']),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Guardar Pregunta'),
              onPressed: () {
                addEditPost();
              },
            ),
          ],
        ),
      ),
    );
  }
}

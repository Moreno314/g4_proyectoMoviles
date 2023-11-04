//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:image_picker/image_picker.dart';

class AddEditPost extends StatefulWidget {
  final postList;
  final index;
  AddEditPost({this.postList, this.index});

  @override
  _AddEditPostState createState() => _AddEditPostState();
}

class _AddEditPostState extends State<AddEditPost> {
  //File _image;
  //final picker = ImagePicker();

  Object? selectedCategory;
  List<dynamic> categoryItem = [];

  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  bool editMode = false;
/*
  Future choiceImage() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage.path);
    });
  }*/

  Future AddEditPost() async {
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
        title: Text(editMode ? 'Update' : 'Añade una pregunta'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: title,
              decoration: InputDecoration(labelText: 'Titulo de la pregunta'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: body,
              maxLines: 4,
              decoration:
                  InputDecoration(labelText: 'Descripcion de la pregunta'),
            ),
          ),
          IconButton(
            onPressed: () {
              //choiceImage();
            },
            icon: Icon(
              Icons.image,
              size: 50,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          /*
          Container(
            child:
                _image == null ? Text('No image selected') : Image.file(_image),
            width: 100,
            height: 100,
          ),
          */
          SizedBox(
            height: 20,
          ),
          DropdownButton(
              isExpanded: true,
              value: selectedCategory,
              hint: Text('Select Category '),
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
              }),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text('Save Post'),
            onPressed: () {
              AddEditPost();
            },
          ),
        ],
      ),
    );
  }
}

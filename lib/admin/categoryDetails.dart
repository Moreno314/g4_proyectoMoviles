import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:parcial_grupo4/admin/addEditCategory.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({Key? key}) : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<dynamic> category = [];

  Future getAllCategory() async {
    try {
      var url = Uri.parse("http://192.168.0.10/g4_avance/CategoryAll.php");
      var response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          category = jsonData;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Details'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditCategory(),
                  ),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: category.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddEditCategory(
                                  categoryList: category,
                                  index: index,
                                )));
                  },
                  icon: Icon(Icons.edit),
                ),
                title: Text(category[index]['name']),
                trailing: IconButton(
                  onPressed: () async {
                    var url = Uri.parse(
                        "http://192.168.0.10/g4_avance/deleteCategory.php");
                    var response = await http.post(url, body: {
                      "id": category[index]['id'],
                    });
                    if (response.statusCode == 200) {
                      showDialog(
                        context: (context),
                        builder: (context) => AlertDialog(
                          title: Text("Mensaje"),
                          content: Text("Category Deleted Succesful"),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel"),
                            )
                          ],
                        ),
                      );
                    }
                  },
                  icon: Icon(Icons.delete),
                ),
              ),
            );
          }),
    );
  }
}

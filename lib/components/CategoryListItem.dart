import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:parcial_grupo4/page/SelectCategoryBy.dart';

class CategoryListItem extends StatefulWidget {
  @override
  _CategoryListItemState createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  List<dynamic> categories = [];

  Future getAllCategory() async {
    try {
      var url = Uri.parse("http://192.168.0.10/g4_avance/CategoryAll.php");
      var response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          categories = jsonData;
        });
        //print(jsonData);
        // return jsonData;
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
    return Container(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryItem(
              categoryName: categories[index]['name'],
            );
          }),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final categoryName;
  CategoryItem({this.categoryName});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 70,
      //width:50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Text(
            widget.categoryName,
            style: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SelectCategoryBy(
                  categoryName: widget.categoryName,
                ),
              ),
            );
            debugPrint(widget.categoryName);
          },
        ),
      ),
    );
  }
}

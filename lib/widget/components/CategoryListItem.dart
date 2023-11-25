import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:parcial_grupo4/models/category_item_model.dart';

import 'package:parcial_grupo4/widget/page/SelectCategoryBy.dart';
// Asegúrate de cambiar 'nombre_de_tu_proyecto'

class CategoryListItem extends StatefulWidget {
  @override
  _CategoryListItemState createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  List<CategoryItemModel> categories = [];

  Future<void> getAllCategory() async {
    try {
      var url = Uri.parse("http://192.168.0.4/g4_avance/CategoryAll.php");
      var response =
          await http.get(url, headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          categories = (jsonData as List)
              .map((category) => CategoryItemModel(
                    name: category['name'],
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
            category: categories[index],
          );
        },
      ),
    );
  }
}
class CategoryItem extends StatelessWidget {
  final CategoryItemModel category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectCategoryBy(
                categoryName: category.name,
              ),
            ),
          );
          debugPrint(category.name);
        },
        child: Container(
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Center(
            child: Text(
              category.name,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
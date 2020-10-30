import 'package:flutter/material.dart';
import '../../data.dart';
import './category_item.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DaliMeal'),
        ),      
        body: GridView(
        padding: const EdgeInsets.all(25),
        children: [
          ...categories.map((category){
            return CategoryWidget(category);
          }).toList()
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
      ),
    );
  }
}
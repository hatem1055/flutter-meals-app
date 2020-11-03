import 'package:flutter/material.dart';
import 'package:meals_app/data.dart';
import '../../models/category.dart';
import '../../data.dart';
import './category_meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routName = 'categorie-meals';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = meals.where((meal){
      return meal.categoryIds.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
        body: Center(
      child: ListView.builder(itemBuilder: (ctx,index){
        return CategoryMeal(categoryMeals[index]);
      },
      itemCount: categoryMeals.length,
      ),
    ));
  }
}

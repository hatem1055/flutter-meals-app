import 'package:flutter/material.dart';
import 'package:meals_app/data.dart';
import 'package:meals_app/models/meal.dart';
import '../../models/category.dart';
import '../../data.dart';
import './category_meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routName = 'categorie-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category category;
  List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    category = ModalRoute.of(context).settings.arguments as Category;
    categoryMeals = meals.where((meal) {
      return meal.categoryIds.contains(category.id);
    }).toList();
    super.didChangeDependencies();
  }

  void removeItem(String id) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: Center(
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return CategoryMeal(categoryMeals[index], removeItem);
            },
            itemCount: categoryMeals.length,
          ),
        ));
  }
}
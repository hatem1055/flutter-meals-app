import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../../models/category.dart';
import './category_meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routName = 'categorie-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category category;
  List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    category = ModalRoute.of(context).settings.arguments as Category;
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categoryIds.contains(category.id);
    }).toList();
    super.didChangeDependencies();
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
              return CategoryMeal(categoryMeals[index]);
            },
            itemCount: categoryMeals.length,
          ),
        ));
  }
}
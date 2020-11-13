import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../category_meals/category_meal.dart';
class Favourits extends StatelessWidget {
  final List<Meal> favouritMeals;
  Favourits(this.favouritMeals);
  @override
  Widget build(BuildContext context) {
    if (favouritMeals.isEmpty) {
      return Center(
          child: Text('You have no favourits yet - start adding some!'));
    } else {
      return Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return CategoryMeal(favouritMeals[index]);
          },
          itemCount: favouritMeals.length,
        ),
      );
    }
  }
}

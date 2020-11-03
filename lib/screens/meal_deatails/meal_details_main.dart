import 'package:flutter/material.dart';
import '../../models/meal.dart';

class MealDetailsMain extends StatelessWidget {
  static const routName = '/meal-details';
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Text('the meal'),
    );
  }
}

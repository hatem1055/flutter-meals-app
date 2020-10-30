import 'package:flutter/material.dart';

import '../category_meals/category_meals_main.dart';
import '../../models/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category categoryData;
  CategoryWidget(this.categoryData);

  void selectCategory(ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routName,arguments:categoryData);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              categoryData.color.withOpacity(0.7),
              categoryData.color
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Text(
          categoryData.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}

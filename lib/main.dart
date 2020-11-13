import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/settings/settings-main.dart';
import 'package:meals_app/screens/tabs-screen/tabs_screen.dart';

import 'package:meals_app/data.dart';
import './screens/categories_screen/categories_main.dart';
import './screens/category_meals/category_meals_main.dart';
import './screens/meal_deatails/meal_details_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map filters = {
    'isGlutenFree': false,
    'isLactoseFree': false,
    'isVegetarian': false,
    'isVegan': false,
  };
  List<Meal> availableMeals = meals;
  void setFilter(filterData) {
    setState(() {
      filters = filterData;

      availableMeals = meals.where((meal) {
        if (filters['isGlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['isLactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['isVegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (filters['isVegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routName: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailsMain.routName: (ctx) => MealDetailsMain(),
        Settings.routeName: (ctx) => Settings(setFilter,filters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}

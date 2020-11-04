import 'package:flutter/material.dart';

import './screens/categories_screen/categories_main.dart';
import './screens/category_meals/category_meals_main.dart';
import './screens/meal_deatails/meal_details_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          bodyText1:TextStyle(
            color:Color.fromRGBO(20, 51, 51, 1)
          ),
          bodyText2:TextStyle(
            color:Color.fromRGBO(20, 51, 51, 1)
          ),
          headline6:TextStyle(
            fontSize:20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )  
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routName: (ctx) => CategoryMealsScreen(),
        MealDetailsMain.routName : (ctx) => MealDetailsMain()
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}


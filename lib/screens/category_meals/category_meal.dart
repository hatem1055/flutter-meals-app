import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../meal_deatails/meal_details_main.dart';

class CategoryMeal extends StatelessWidget {
  final Meal meal;
  CategoryMeal(this.meal);
  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsMain.routName,arguments: meal);
  }

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'Unkonw';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unkonw';
    }
  }

  Widget footerElement(String text, IconData icon) {
    return Container(
      child: Row(
        children: [Icon(icon), SizedBox(width: 6), Text(text,style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400
        ),)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: Container(
                    width: 300,
                    color: Colors.black45,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    footerElement(
                        '${meal.duration.toString()} min', Icons.schedule),
                    footerElement(complexityText, Icons.work),
                    footerElement(affordabilityText, Icons.attach_money),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

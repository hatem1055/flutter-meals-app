import 'package:flutter/material.dart';
import '../../models/meal.dart';

class MealDetailsMain extends StatelessWidget {
  static const routName = '/meal-details';
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    Widget buildTitle(text) {
      return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline6,
          ));
    }

    Widget buildContainer({Widget child}) {
      return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          height: 200,
          width: MediaQuery.of(context).size.width * 0.7,
          child: child);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildTitle('Ingrediatns'),
          buildContainer(child:ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(meal.ingredients[index]),
                ),
              );
            },
            itemCount: meal.ingredients.length,
          )),
          buildTitle('Steps'),
          buildContainer(child: ListView.builder(itemBuilder: (ctx,index){
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Text('# ${index + 1}'),),
                  title: Text(meal.steps[index]),
                ),
                Divider()
              ],
            );
          },
          itemCount: meal.steps.length,
          )
        )
        ]),
      ),
    );
  }
}

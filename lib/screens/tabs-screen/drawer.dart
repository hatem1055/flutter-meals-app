import 'package:flutter/material.dart';
import 'package:meals_app/screens/settings/settings-main.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerLink(BuildContext ctx,String text, IconData icon, String route) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
          Navigator.of(ctx).popAndPushNamed(route);
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildDrawerLink(context,'Meals', Icons.restaurant,'/' ),
        buildDrawerLink(context,'Filters', Icons.settings,Settings.routeName)
      ]),
    );
  }
}

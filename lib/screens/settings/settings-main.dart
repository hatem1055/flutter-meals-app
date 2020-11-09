import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs-screen/drawer.dart';

class Settings extends StatelessWidget {
  static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        drawer: MainDrawer(),
        body: Center(
          child: Text('Settings'),
        ));
  }
}

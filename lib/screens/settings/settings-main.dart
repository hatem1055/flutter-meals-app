import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs-screen/drawer.dart';

class Settings extends StatefulWidget {
  static const routeName = '/settings';
  final Function setFilter;
  final Map filtersData;
  Settings(this.setFilter, this.filtersData);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with RouteAware {
  Map filters = {
    'isGlutenFree': {
      'value': false,
      'title': 'Gluten-free',
      'subtitle': 'Only include gluten-free meals',
    },
    'isLactoseFree': {
      'value': false,
      'title': 'lactos-free',
      'subtitle': 'Only include lactos-free meals',
    },
    'isVegetarian': {
      'value': false,
      'title': 'Vegetarian',
      'subtitle': 'Only include vegetarian-free meals',
    },
    'isVegan': {
      'value': false,
      'title': 'Vegan',
      'subtitle': 'Only include vegan-free meals',
    },
  };
  Widget buildSwich(
      bool value, String title, String subtitle, Function onChange) {
    return SwitchListTile(
      value: value,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: onChange,
    );
  }

  
  @override
  void initState() {
    widget.filtersData.forEach((key, value) {
      filters[key]['value'] = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final filtersData = {
                    'isGlutenFree': filters['isGlutenFree']['value'],
                    'isLactoseFree': filters['isLactoseFree']['value'],
                    'isVegetarian': filters['isVegetarian']['value'],
                    'isVegan': filters['isVegan']['value'],
                  };
                  widget.setFilter(filtersData);
                  Navigator.of(context).pushNamed('/');
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
              child: ListView(
            children: [
              ...filters.entries.map((entry) {
                final filter = entry.value;
                return buildSwich(
                    filter['value'], filter['title'], filter['subtitle'],
                    (newValue) {
                  setState(() {
                    filter['value'] = newValue;
                  });
                });
              }).toList()
            ],
          ))
        ]),
    );
  }
}

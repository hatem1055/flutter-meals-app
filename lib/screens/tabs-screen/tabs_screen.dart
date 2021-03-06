import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen/categories_main.dart';
import 'package:meals_app/screens/favorits_screen/favourits_main.dart';
import 'package:meals_app/screens/tabs-screen/drawer.dart';


class TabsScreen extends StatefulWidget {
  final List faveroutMeals;
  TabsScreen(this.faveroutMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> pages;
  @override
  void initState(){
    pages = [
    {'widget': CategoriesScreen(), 'title': 'Categories'} ,
    {'widget': Favourits(widget.faveroutMeals), 'title': 'Favorites'}
  ];
    super.initState();
  }
  int selectedPageIndex = 0;
  void selectPage(index) {
    setState(() {
      selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title']),
      ),
      body: pages[selectedPageIndex]['widget'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPageIndex,
        onTap: (index) {
          selectPage(index);
        },
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'favorites',
              backgroundColor: Theme.of(context).primaryColor),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

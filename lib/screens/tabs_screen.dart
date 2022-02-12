// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:meal_app1/models/meal.dart';
import '../widgets/main_drawer.dart';

import 'categories_screens.dart';
import 'favourites.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;
  TabsScreen(this._favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   late List<Map<String, dynamic>> _Pages;
  int _selectedPageIndex = 0;
  void _selectedBottemItem(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }
  @override
  void initState() {
    _Pages = [
    {
    'page': CategoriesScreens(),
    'title': 'Categories',
    },
    {
    'page': Favourites(widget._favoriteMeals),
    'title': 'Your Favourites',
    }
    ];
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "${_Pages[_selectedPageIndex]['title']}",
        ),
        centerTitle: true,
      ),
      body: _Pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedBottemItem,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            title: Text("Favorites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

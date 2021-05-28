import 'package:flutter/material.dart';
import 'package:meals_app/Models/Meal.dart';
import 'package:meals_app/Screens/categoriws_screen.dart';
import 'package:meals_app/Screens/favsScreen.dart';
import 'package:meals_app/Widgets/mainDrawer.dart';

class TabsScreen extends StatefulWidget {
  final String title;
  final List<Meal> favMeals;

  TabsScreen(this.title, this.favMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _list = [];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _list = [CategoriesScreen(), FavsScreen(widget.favMeals)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MainDrawer(),
      body: _list[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}

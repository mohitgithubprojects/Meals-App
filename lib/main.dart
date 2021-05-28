import 'package:flutter/material.dart';
import 'package:meals_app/Models/Meal.dart';
import 'package:meals_app/Screens/categoriws_screen.dart';
import 'package:meals_app/Screens/categoryMealsScreen.dart';
import 'package:meals_app/Screens/filtersScreen.dart';
import 'package:meals_app/Screens/mealDetailScreen.dart';
import 'package:meals_app/Screens/tabsScreen.dart';
import 'package:meals_app/dummyData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _setFilters(Map<String , bool> filterData, BuildContext buildContext){
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if(_filters['gluten'] && !element.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if(_filters['vegan'] && !element.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !element.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });

    _showToast(buildContext, 'Filters Saved !');

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Colors.white,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(color: Colors.black),
              bodyText1: TextStyle(color: Colors.black),
              headline6: TextStyle(
                  fontSize: 16,
                  fontFamily: 'RobotoCondensed',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/', // by default it is slash
      routes: {
        '/' : (ctx) => TabsScreen('IndiMeals'),
        CategoriesScreen.routeName : (ctx) => CategoriesScreen(),// it is the home screen
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
        FiltersScreen.routeName : (ctx) => FiltersScreen(_filters,_setFilters),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Text('Navigation Time !')),
    );
  }
}

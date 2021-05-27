import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categoriws_screen.dart';
import 'package:meals_app/Screens/categoryMealsScreen.dart';
import 'package:meals_app/Screens/mealDetailScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/' : (ctx) => CategoriesScreen('IndiMeals'),  // it is the home screen
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
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

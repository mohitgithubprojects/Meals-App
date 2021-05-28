import 'package:flutter/material.dart';
import 'package:meals_app/Models/Meal.dart';
import 'package:meals_app/Widgets/mealsItemView.dart';
import 'package:meals_app/dummyData.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routeName = '/category-meals'; // for directly accessing the route name without using class

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final filteredMeals = availableMeals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: ListView.builder(itemBuilder: (ctx, pos) {
        return MealItem(filteredMeals[pos]);
      },itemCount: filteredMeals.length,),
    );
  }
}

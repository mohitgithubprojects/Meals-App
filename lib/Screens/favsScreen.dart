import 'package:flutter/material.dart';
import 'package:meals_app/Models/Meal.dart';
import 'package:meals_app/Widgets/mealsItemView.dart';

class FavsScreen extends StatelessWidget {
  final List<Meal> mealsList;

  FavsScreen(this.mealsList);

  @override
  Widget build(BuildContext context) {
    if(mealsList.isEmpty){
      return Center(
        child: Text('You have no favs yet - start adding some !'),
      );
    }else{
      return ListView.builder(itemBuilder: (ctx, pos) {
        return MealItem(mealsList[pos]);
      },itemCount: mealsList.length,);
    }
  }
}

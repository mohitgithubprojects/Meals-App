import 'package:flutter/material.dart';
import 'package:meals_app/Models/Meal.dart';
import 'package:meals_app/Screens/mealDetailScreen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  void onMealItemClicked(BuildContext buildContext) {
    Navigator.of(buildContext).pushNamed(MealDetailScreen.routeName, arguments: {
      'mealItem':meal,
    });
  }

  String get complexity{

    switch (meal.complexity){
      case Complexity.Simple :
        return 'Simple';
        break;
      case Complexity.Challenging :
        return 'Challenging';
        break;
      case Complexity.Hard :
        return 'Hard';
        break;
      default :
        return 'Unknown';
    }

  }

  String get affordability{

    switch (meal.affordability){
      case Affordability.Affordable :
        return 'Affordable';
        break;
      case Affordability.Pricey :
        return 'Pricey';
        break;
      case Affordability.Luxurious :
        return 'Luxurious';
        break;
      default :
        return 'Unknown';
    }

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onMealItemClicked(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 25,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexity)
                    ],
                  ),
                  Row(
                    children: [
                      Text('₹',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordability)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

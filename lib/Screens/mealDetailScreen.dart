import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Models/Meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealDetailScreen';

  final Function toggleFav;
  final Function isMealFav;

  MealDetailScreen(this.toggleFav, this.isMealFav);

  Widget _buildSection(String title, List<String> list, BuildContext buildContext){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        title == 'Ingredients' ? Container(
          decoration: BoxDecoration(
            color: Theme.of(buildContext).accentColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 200,
          width: 300,
          child: ListView.builder(
            itemBuilder: (ctx, pos) {
              return Card(
                elevation: 3,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(list[pos]),
                ),
              );
            },
            itemCount: list.length,),
        ) : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            padding: EdgeInsets.all(10),
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (ctx, pos) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${pos+1}'),
                      ),
                      title: Text(list[pos]),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: list.length,)
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, Meal>;
    final mealItem = routeArgs['mealItem'];

    return Scaffold(
      appBar: AppBar(
        title: Text(mealItem.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15,right: 15,top: 15),
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  mealItem.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildSection('Ingredients', mealItem.ingredients, context),
            _buildSection('Recipe Steps', mealItem.steps, context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isMealFav(mealItem.id) ? Icons.star : Icons.star_border
        ),
        onPressed: () {
          toggleFav(mealItem.id);
        },
      ),
    );
  }
}

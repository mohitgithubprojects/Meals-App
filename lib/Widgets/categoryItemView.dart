import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categoryMealsScreen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;

  CategoryItem({@required this.id, @required this.title,@required this.bgColor});

  void onCategoryClick(BuildContext buildContext) {
    Navigator.of(buildContext).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id':id,
      'title':title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCategoryClick(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [bgColor.withOpacity(0.6), bgColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

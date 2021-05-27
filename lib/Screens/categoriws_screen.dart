import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/categoryItemView.dart';

import '../dummyData.dart';

class CategoriesScreen extends StatelessWidget {
  final String title;

  CategoriesScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((e) => CategoryItem(
                    id: e.id,
                    title: e.title,
                    bgColor: e.color,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}

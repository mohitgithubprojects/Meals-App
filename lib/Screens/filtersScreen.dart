import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/mainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filtersScreen';

  final Function saveFilters;
  final Map<String , bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;

  var _isVegan = false;

  var _isVegetarian = false;

  var _lactoseFree = false;


  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
  }

  Widget _switches(
      bool type, String title, String subtitle, Function updateValue) {
    return SwitchListTile(
        value: type,
        title: Text(title),
        subtitle: Text(subtitle),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(onPressed: () {
              final selectedFilters = {
                'gluten':_glutenFree,
                'lactose':_lactoseFree,
                'vegan':_isVegan,
                'vegetarian':_isVegetarian,
              };
              widget.saveFilters(selectedFilters,context);
            }, icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _switches(
                    _glutenFree,
                    'Gluten - Free',
                    'Only include gluten free meals.',
                    (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    }),
                _switches(
                    _lactoseFree,
                    'Lactose - Free',
                    'Only include lactose free meals.',
                    (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    }),
                _switches(
                    _isVegan,
                    'Vegan',
                    'Only include vegan meals.',
                    (value) {
                      setState(() {
                        _isVegan = value;
                      });
                    }),
                _switches(
                    _isVegetarian,
                    'Veg Meals',
                    'Only include veg meals.',
                    (value) {
                      setState(() {
                        _isVegetarian = value;
                      });
                    }),
              ],
            ))
          ],
        ));
  }
}

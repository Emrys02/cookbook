import 'package:cookbook/screens/meal_recipe.dart';
import 'package:flutter/material.dart';

import 'screens/available_meals.dart';
import 'widget/categories_list.dart';

void main() => runApp(_CookBookApp());

class _CookBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu_rounded),
            title: const Text('CookBook'),
          ),
          body: CategoriesList()),
      routes: {
        AvailableMeals.route(): (context) => AvailableMeals(),
        MealRecipe.route():(context) => MealRecipe(),
      },
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

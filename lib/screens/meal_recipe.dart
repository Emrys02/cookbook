import '../data/dummy_data.dart';
import 'package:flutter/material.dart';

class MealRecipe extends StatelessWidget {
  static String route() {
    return "/recipe";
  }

  @override
  Widget build(BuildContext context) {
    final detail =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final id = detail['id'];
    final ingredients = dummyMeals.where((element) {
      return element.ingredients.contains(element.id == id);
    });
    final recipe = dummyMeals.where((element) {
      return element.steps.contains(element.id == id);
    });
    return Center(child:Text('Working Fine'));
  }
}

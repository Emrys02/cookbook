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
      return element.ingredients.contains(id);
    });
    final recipe = dummyMeals.where((element) {
      return element.steps.contains(id);
    });
    final name = dummyMeals.where((element) {
      return element.title.contains(id!);
    });
    return Scaffold(
      appBar: AppBar(title: Text('$name')),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                ...ingredients.map((current) {
                  return Text('$current');
                }),
                Card(
                  child: Column(
                    children: [
                      ...recipe.map((current) {
                        return Text('$current');
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widget/meal_preview.dart';

class AvailableMeals extends StatelessWidget {
  static String route() {
    return '/differentmeals';
  }

  @override
  Widget build(BuildContext context) {
    final details =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final pagetitle = details['title'];
    final pageid = details['id'];

    final mealCategories = dummyMeals.where((meal) {
      return meal.categories.contains(pageid);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("$pagetitle"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealPreview(
              affordability: mealCategories[index].affordability,
              complexity: mealCategories[index].complexity,
              duration: mealCategories[index].duration,
              imageUrl: mealCategories[index].imageUrl,
              title: mealCategories[index].title, 
              id: mealCategories[index].id,);
        },
        itemCount: mealCategories.length,
      ),
    );
  }
}

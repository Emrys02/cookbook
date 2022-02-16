import 'package:cookbook/models/meal.dart';
import 'package:flutter/material.dart';
import '../widget/meal_preview.dart';

class AvailableMeals extends StatelessWidget {
  static const route = '/differentmeals';
  final List<Meal> _availableMeals;
  final Function _toggleFavourite;
  final Function _isFavourite;
  const AvailableMeals(this._availableMeals, this._toggleFavourite, this._isFavourite);
  @override
  Widget build(BuildContext context) {
    final details =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final pagetitle = details['title'];
    final pageid = details['id'];
    final mealCategories = _availableMeals.where((meal) {
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
            id: mealCategories[index].id,
            toggleFavourite: _toggleFavourite,
            state: _isFavourite(pageid),
          );
        },
        itemCount: mealCategories.length,
      ),
    );
  }
}

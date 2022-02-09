import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class AvailableMeals extends StatelessWidget {
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
      appBar: AppBar(title: Text("$pagetitle")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(mealCategories[index].title);
        },
        itemCount: mealCategories.length,
      ),
    );
  }
}

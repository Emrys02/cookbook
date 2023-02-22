import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavouritesList extends StatelessWidget {
  static const route = 'favourites';

  final List<Meal> _favouriteMeals;
  const FavouritesList(this._favouriteMeals, {super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No Favourites Selected"));
  }
}

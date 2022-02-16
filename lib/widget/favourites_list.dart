import '../models/meal.dart';
import 'package:flutter/material.dart';

class FavouritesList extends StatelessWidget {
  static const route = 'favourites';

  List<Meal> _favouriteMeals;
  FavouritesList(this._favouriteMeals);
  @override
  Widget build(BuildContext context) {
    return Text("No Favourites Selected");
  }
}

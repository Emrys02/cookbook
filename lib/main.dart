import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'models/filter_data.dart';
import 'models/meal.dart';
import 'screens/available_meals.dart';
import 'screens/filters.dart';
import 'screens/meal_recipe.dart';
import 'screens/navigation_pages.dart';
import 'widget/categories_list.dart';
import 'widget/favourites_list.dart';
import 'widget/side_drawer.dart';

void main() => runApp(_CookBookApp());

class _CookBookApp extends StatefulWidget {
  @override
  State<_CookBookApp> createState() => _CookBookAppState();
}

class _CookBookAppState extends State<_CookBookApp> {
  FilterData filters = FilterData(gluten: false, lactose: false, vegan: false);

  void _setfilters(FilterData filtersData) {
    setState(() {
      filters = filtersData;

      _availableMeals = dummyMeals.where((meal) {
        if (filters.gluten && !meal.glutenFree) {
          return false;
        }
        if (filters.vegan && !meal.vegan) {
          return false;
        }
        if (filters.lactose && !meal.lactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Meal> _availableMeals = dummyMeals;

  final List<Meal> _favouriteMeals = [];

  void _toggleFavourite(String mealId) {
    final index = _favouriteMeals.indexWhere((element) => element.id == mealId);
    if (index >= 0) {
      setState(() {
        _favouriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favouriteMeals.add(dummyMeals.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isFavourite(String id) {
    return _favouriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => SafeArea(child: child!),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CookBook'),
        ),
        drawer: const SideDrawer(),
        body: NavigationPages(_favouriteMeals, _availableMeals),
      ),
      routes: {
        AvailableMeals.route: (context) => AvailableMeals(_availableMeals, _toggleFavourite, isFavourite),
        MealRecipe.route: (context) => const MealRecipe(),
        FavouritesList.route: (context) => FavouritesList(_favouriteMeals),
        CategoriesList.route: (context) => CategoriesList(_availableMeals),
        Filters.route: (context) => Filters(filters, _setfilters),
      },
    );
  }
}

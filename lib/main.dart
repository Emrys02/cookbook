import 'package:flutter/material.dart';

import 'screens/available_meals.dart';
import 'widget/categories_list.dart';
import 'screens/meal_recipe.dart';
import 'widget/favourites_list.dart';

void main() => runApp(_CookBookApp());

class _CookBookApp extends StatefulWidget {
  @override
  State<_CookBookApp> createState() => _CookBookAppState();
}

class _CookBookAppState extends State<_CookBookApp> {
  final List<Widget> _pages = [CategoriesList(), FavouritesList()];

  int selectedPageIndex = 0;

  void _selectpage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu_rounded),
          title: const Text('CookBook'),
        ),
        body: _pages[selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded), 
                label: 'Favourites',
            )
          ],
          onTap: (index) => _selectpage(index),
          currentIndex: selectedPageIndex,
        ),
      ),
      routes: {
        AvailableMeals.route(): (context) => AvailableMeals(),
        MealRecipe.route(): (context) => MealRecipe(),
      },
    );
  }
}

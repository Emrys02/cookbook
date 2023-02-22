import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/categories_list.dart';
import '../widget/favourites_list.dart';

class NavigationPages extends StatefulWidget {
  final List<Meal> _favouriteMeals;
  final List<Meal> _availableMeals;
  const NavigationPages(this._favouriteMeals, this._availableMeals, {super.key});

  @override
  State<NavigationPages> createState() => _NavigationPagesState();
}

class _NavigationPagesState extends State<NavigationPages> {
  int selectedPageIndex = 0;
  void _selectpage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }

  List pages = [];

  @override
  void initState() {
    pages = [CategoriesList(widget._availableMeals), FavouritesList(widget._favouriteMeals)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_rounded,
              color: Colors.blue,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_rounded,
              color: Colors.blue,
            ),
            label: 'Favourites',
          )
        ],
        onTap: (index) => _selectpage(index),
        currentIndex: selectedPageIndex,
      ),
    );
  }
}

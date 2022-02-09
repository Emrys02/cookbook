import 'package:cookbook/data/dummy_data.dart';
import 'package:flutter/material.dart';

class MealRecipe extends StatelessWidget {
  static String route() {
    return "/recipe";
  }

  @override
  Widget build(BuildContext context) {
    return Card(child: Text('data')
    );
  }
}

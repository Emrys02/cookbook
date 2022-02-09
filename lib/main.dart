import 'package:flutter/material.dart';

import 'screens/available_meals.dart';
import 'widget/categories_list.dart';

void main() => runApp(_CookBookApp());

class _CookBookApp extends StatefulWidget {
  @override
  _CookBookAppState createState() => _CookBookAppState();
}

class _CookBookAppState extends State<_CookBookApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('CookBook'),
          ),
          body: CategoriesList()),
      routes: {
        "/recipies": (context) => AvailableMeals(),
      },
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

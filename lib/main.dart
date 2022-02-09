import 'package:flutter/material.dart';

import 'models/categories.dart';
import 'widget/recipies_pag.dart';

void main() => runApp(_CookBookApp());

class _CookBookApp extends StatefulWidget {
  @override
  _CookBookAppState createState() => _CookBookAppState();
}

class _CookBookAppState extends State<_CookBookApp> {
  List<Category> temp = [
    Category(id: 'c1', color: Colors.purple, title: 'italian'),
    Category(id: 'c2', color: Colors.red, title: 'mexican'),
    Category(id: 'c3', color: Colors.blue, title: 'chinese'),
    Category(id: 'c4', color: Colors.green, title: 'african'),
    Category(id: 'c5', color: Colors.yellow, title: 'japanese'),
    Category(id: 'c6', color: Colors.teal, title: 'indian'),
    Category(id: 'c7', color: Colors.amber, title: 'italian'),
    Category(id: 'c8', color: Colors.indigo, title: 'mexican'),
    Category(id: 'c9', color: Colors.black, title: 'chinese'),
    Category(id: 'c10', color: Colors.brown, title: 'african'),
    Category(id: 'c11', color: Colors.orange, title: 'japanese'),
    Category(id: 'c12', color: Colors.lime, title: 'indian'),
  ];

  void changeToRecipe(context, String pagetitle, String pageid) {
    Navigator.of(context).pushNamed(
      '/recipies', 
      arguments: {
        'id': pageid, 
        'title': pagetitle
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CookBook'),
        ),
        body: Center(
          child: GridView(
            padding: EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              mainAxisSpacing: 10,
              childAspectRatio: 4 / 3,
              crossAxisSpacing: 10,
            ),
            children: temp.map((cat) {
              return InkWell(
                onTap: () => changeToRecipe(context, cat.title, cat.id),
                radius: 10,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  child: Text(cat.title),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: SweepGradient(colors: [
                      cat.color.withOpacity(0.3),
                      cat.color.withOpacity(0.5),
                      cat.color.withOpacity(0.8),
                      cat.color
                    ]),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
      routes: {
        "/recipies": (context)=>Recipies(),
      },
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

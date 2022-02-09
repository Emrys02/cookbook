import 'package:cookbook/data/dummy_data.dart';
import 'package:flutter/material.dart';


class CategoriesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    void changeToRecipe(context, String pagetitle, String pageid) {
      Navigator.of(context).pushNamed('/recipies',
          arguments: {'id': pageid, 'title': pagetitle});
    }

    return Center(
      child: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          mainAxisSpacing: 10,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 10,
        ),
        children: dummyCategories.map((cat) {
          return InkWell(
            onTap: () => changeToRecipe(context, cat.title, cat.id),
            radius: 10,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(cat.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
              ),
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
    );
  }
}

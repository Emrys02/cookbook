import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../screens/available_meals.dart';

class CategoriesList extends StatelessWidget {
  static const route = 'home';

  final List<Meal> _availableMeals;

  const CategoriesList(this._availableMeals,{super.key});

  @override
  Widget build(BuildContext context) {
    final deviceProperties = MediaQuery.of(context);

    void changeToRecipe(context, String pagetitle, String pageid) {
      Navigator.of(context).pushNamed(AvailableMeals.route, arguments: {'id': pageid, 'title': pagetitle});
    }


    return Center(
      child: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: deviceProperties.size.width * 0.5,
          mainAxisSpacing: 10,
          childAspectRatio: 5 / 3,
          crossAxisSpacing: 10,
        ),
        children: dummyCategories.map((cat) {
          var id = cat.id;
          var foods = _availableMeals.firstWhere((element) => element.categories.contains(id));
          var imageurl = foods.imageUrl;
          return InkWell(
              onTap: () => changeToRecipe(context, cat.title, cat.id),
              radius: 10,
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(15),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'lib/images/loading.gif',
                      image: imageurl,
                      height: deviceProperties.size.height * 0.3,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(3)),
                      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                      child: Text(
                        cat.title,
                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ));
        }).toList(),
      ),
    );
  }
}

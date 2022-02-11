import 'package:cookbook/data/dummy_data.dart';
import 'package:cookbook/screens/available_meals.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void changeToRecipe(context, String pagetitle, String pageid) {
      Navigator.of(context).pushNamed(AvailableMeals.route(),
          arguments: {'id': pageid, 'title': pagetitle});
    }

    final deviceProperties = MediaQuery.of(context);

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
          var foods = dummyMeals
              .firstWhere((element) => element.categories.contains(id));
          var imageurl = foods.imageUrl;
          return InkWell(
            onTap: () => changeToRecipe(context, cat.title, cat.id),
            radius: 10,
            borderRadius: BorderRadius.circular(15),
            child: Stack(children: [
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(15),
                child:  Image.network(
                  imageurl, 
                  width: double.infinity,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Positioned(
                bottom: 5, 
                left: 5, 
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black38, 
                    borderRadius: BorderRadius.circular(3)), 
                    padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3), 
                  child: Text(
                    cat.title, 
                    style: const TextStyle(
                      fontWeight: FontWeight.w400, 
                      fontSize: 15),
                  ),
                ),
              ),
            ],)
          );
        }).toList(),
      ),
    );
  }
}

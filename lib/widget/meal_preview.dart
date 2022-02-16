import 'package:flutter/material.dart';

import '../screens/meal_recipe.dart';
import '../models/meal.dart';

class MealPreview extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;
  final Function toggleFavourite;
  final bool state;

  MealPreview(
      {required this.affordability,
      required this.complexity,
      required this.duration,
      required this.imageUrl,
      required this.title,
      required this.id,
      required this.toggleFavourite,
      required this.state});

  String get difficulty {
    switch (complexity) {
      case Complexity.simple:
        return 'Easy';
      case Complexity.challenging:
        return 'Testing';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get price {
    switch (affordability) {
      case Affordability.cheap:
        return 'Cheap';
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.quiteExpensive:
        return 'Quite Expensive';
      case Affordability.veryExpensive:
        return 'Very Expensive';
      default:
        return 'Unknown';
    }
  }

  void changeToMealrecipe(context) {
    Navigator.of(context)
        .pushNamed(MealRecipe.route, arguments: {'id': id});
  }

  Widget CustomSwitch(bool state) {
    if (state) {
      return IconButton(
          onPressed: ()=> toggleFavourite(id),
          icon: Icon(
            Icons.favorite_rounded,
            color: Colors.pink,
          ));
    } else {
      return IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.black,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceProperties = MediaQuery.of(context);

    return InkWell(
      radius: 20,
      borderRadius: BorderRadius.circular(30),
      splashColor: Colors.blue,
      onTap: () => changeToMealrecipe(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'lib/images/loading.gif',
                    image: imageUrl,
                    height: deviceProperties.size.height * 0.3,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  clipBehavior: Clip.antiAlias,
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
                        color: Colors.black38,
                        width: 150,
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.clip,
                          maxLines: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                    ),
                    Text('$duration mins'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.work_outline_rounded,
                      color: Colors.black,
                    ),
                    Text(difficulty),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.attach_money_rounded,
                      color: Colors.green,
                    ),
                    Text(price),
                  ],
                ),
                CustomSwitch(state),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

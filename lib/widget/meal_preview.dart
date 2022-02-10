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

  const MealPreview(
      {required this.affordability,
      required this.complexity,
      required this.duration,
      required this.imageUrl,
      required this.title,
      required this.id});

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
    Navigator.of(context).pushNamed(MealRecipe.route(), arguments: {'id': id});
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
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
                        padding: const EdgeInsets.symmetric(vertical:10, horizontal:0),
                        color: Colors.black54,
                        width: 200,
                        child: Text(
                          title,
                          style: const TextStyle(fontSize: 20, color: Colors.white),
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
            const SizedBox(
              height: 10,
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

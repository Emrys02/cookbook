import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealRecipe extends StatefulWidget {
  static const route = "/recipe";
  @override
  State<MealRecipe> createState() => _MealRecipeState();
  const MealRecipe({super.key});
}

class _MealRecipeState extends State<MealRecipe> {
  bool isIngredients = true;

  get style1 {
    switch (isIngredients) {
      case true:
        return Colors.grey.withOpacity(0.1);
      default:
        return Colors.white12;
    }
  }

  get style2 {
    switch (isIngredients) {
      case false:
        return Colors.grey.withOpacity(0.1);
      default:
        return Colors.white12;
    }
  }

  @override
  Widget build(BuildContext context) {
    final detail = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final id = detail['id'];

    final selectedmeal = dummyMeals.firstWhere((element) => element.id == id);
    final ingredients = selectedmeal.ingredients;
    final recipe = selectedmeal.steps;
    final name = selectedmeal.title;
    final imagelink = selectedmeal.imageUrl;

    final deviceProperties = MediaQuery.of(context);
    final appbar = AppBar(title: Text(name));

    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            height: (deviceProperties.size.height - deviceProperties.padding.top - appbar.preferredSize.height) * 0.3,
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage.assetNetwork(
                placeholder: 'lib/images/loading.gif',
                image: imagelink,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: (deviceProperties.size.height - deviceProperties.padding.top - appbar.preferredSize.height) * 0.15,
            width: deviceProperties.size.width,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: deviceProperties.size.width * 0.45,
                  decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(20)), color: style1),
                  margin: EdgeInsets.only(left: (deviceProperties.size.width * 0.05)),
                  child: TextButton(
                    onPressed: () => setState(() {
                      isIngredients = true;
                    }),
                    child: const Text(
                      'Ingredients',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: deviceProperties.size.width * 0.45,
                  decoration: BoxDecoration(borderRadius: const BorderRadius.only(topRight: Radius.circular(20)), color: style2),
                  margin: EdgeInsets.only(right: (deviceProperties.size.width * 0.05)),
                  child: TextButton(
                    onPressed: () => setState(() {
                      isIngredients = false;
                    }),
                    child: const Text(
                      'Recipe',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isIngredients)
            Expanded(
              child: Container(
                height: (deviceProperties.size.height - deviceProperties.padding.top - appbar.preferredSize.height) * 0.5,
                margin: EdgeInsets.symmetric(horizontal: (deviceProperties.size.width * 0.05)),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        ingredients[index],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Divider(),
                    );
                  },
                  itemCount: ingredients.length,
                ),
              ),
            ),
          if (!isIngredients)
            Expanded(
              child: Container(
                height: (deviceProperties.size.height - deviceProperties.padding.top - appbar.preferredSize.height) * 0.5,
                margin: EdgeInsets.symmetric(horizontal: (deviceProperties.size.width * 0.05)),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(recipe[index], style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: const Divider(),
                    );
                  },
                  itemCount: recipe.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

enum Complexity { simple, challenging, hard }

enum Affordability { cheap, affordable, quiteExpensive, veryExpensive }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool glutenFree;
  final bool lactoseFree;
  final bool vegan;

  const Meal(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.ingredients,
      required this.complexity,
      required this.duration,
      required this.steps,
      required this.affordability,
      required this.glutenFree,
      required this.lactoseFree,
      required this.vegan});
}

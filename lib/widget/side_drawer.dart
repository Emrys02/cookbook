import 'package:flutter/material.dart';

import '../screens/filters.dart';
import 'categories_list.dart';
import 'favourites_list.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      child: SizedBox(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Categories'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(CategoriesList.route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_rounded),
              title: const Text('Favourites'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(FavouritesList.route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Filters'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Filters.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}

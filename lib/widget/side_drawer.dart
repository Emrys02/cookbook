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
      child: Container(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.restaurant),
              title: Text('Categories'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(CategoriesList.route);
            
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_rounded),
              title: Text('Favourites'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(FavouritesList.route);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Filters'),
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

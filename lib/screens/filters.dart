import 'package:cookbook/models/filter_data.dart';
import 'package:flutter/material.dart';

import '../widget/side_drawer.dart';

class Filters extends StatefulWidget {
  static const route = 'filters';

  final FilterData currentFilters;
  final Function saveFilters;

  const Filters(this.currentFilters, this.saveFilters, {super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

Widget displayer({required bool value, required Function function, required String text, required String subtitle, required IconData icon}) {
  return SwitchListTile(
    value: value,
    onChanged: (state) => function,
    title: Text(text),
    subtitle: Text(subtitle),
    secondary: Icon(icon),
  );
}

class _FiltersState extends State<Filters> {
  bool glutenFree = false;
  bool vegan = false;
  bool lactoseFree = false;
  @override
  void initState() {
    glutenFree = widget.currentFilters.gluten;
    lactoseFree = widget.currentFilters.lactose;
    vegan = widget.currentFilters.vegan;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CookBook'),
        actions: [
          IconButton(
              onPressed: () {
                var filterData = FilterData(gluten: glutenFree, lactose: lactoseFree, vegan: vegan);
                widget.saveFilters(filterData);
              },
              icon: const Icon(Icons.save_rounded)),
        ],
      ),
      drawer: const SideDrawer(),
      body: Expanded(
        child: Column(
          children: [
            displayer(
              value: glutenFree,
              text: 'Gluten Free',
              subtitle: 'Shows only gluten free food',
              function: (newValue) {
                setState(() {
                  glutenFree = newValue;
                });
              },
              icon: Icons.looks_one_rounded,
            ),
            displayer(
              value: lactoseFree,
              function: (newValue) {
                setState(() {
                  lactoseFree = newValue;
                });
              },
              text: 'Lactose Free',
              subtitle: 'Shows only lactose free food',
              icon: Icons.looks_two_rounded,
            ),
            displayer(
              value: vegan,
              function: (newValue) {
                setState(() {
                  vegan = newValue;
                });
              },
              text: 'Vegan',
              subtitle: 'Shows only vegan food',
              icon: Icons.looks_3_rounded,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {
                  FilterData filterData = FilterData(gluten: glutenFree, lactose: lactoseFree, vegan: vegan);
                  widget.saveFilters(filterData);
                },
                icon: const Icon(Icons.save_rounded),
                label: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

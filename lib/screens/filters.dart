import 'package:cookbook/models/filter_data.dart';

import '../widget/side_drawer.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  static const route = 'filters';
  bool glutenFree = false;
  bool vegan = false;
  bool lactoseFree = false;

  final FilterData currentFilters;
  final Function saveFilters;

  Filters(this.currentFilters, this.saveFilters);

  @override
  State<Filters> createState() => _FiltersState();
}

Widget Displayer(
    {required bool value,
    required Function function,
    required String text,
    required String subtitle,
    required IconData icon}) {
  return SwitchListTile(
    value: value,
    onChanged: (state) => function,
    title: Text(text),
    subtitle: Text(subtitle),
    secondary: Icon(icon),
  );
}

class _FiltersState extends State<Filters> {
  @override
  void initState() {
    widget.glutenFree = widget.currentFilters.gluten;
    widget.lactoseFree = widget.currentFilters.lactose;
    widget.vegan = widget.currentFilters.vegan;
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
                var _filterData = FilterData(
                    gluten: widget.glutenFree,
                    lactose: widget.lactoseFree,
                    vegan: widget.vegan);
                widget.saveFilters(_filterData);
              },
              icon: const Icon(Icons.save_rounded)),
        ],
      ),
      drawer: const SideDrawer(),
      body: Expanded(
        child: Column(
          children: [
            Displayer(
              value: widget.glutenFree,
              text: 'Gluten Free',
              subtitle: 'Shows only gluten free food',
              function: (newValue) {
                setState(() {
                  widget.glutenFree = newValue;
                });
              },
              icon: Icons.looks_one_rounded,
            ),
            Displayer(
              value: widget.lactoseFree,
              function: (newValue) {
                setState(() {
                  widget.lactoseFree = newValue;
                });
              },
              text: 'Lactose Free',
              subtitle: 'Shows only lactose free food',
              icon: Icons.looks_two_rounded,
            ),
            Displayer(
              value: widget.vegan,
              function: (newValue) {
                setState(() {
                  widget.vegan = newValue;
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
                  var _filterData = FilterData(
                      gluten: widget.glutenFree,
                      lactose: widget.lactoseFree,
                      vegan: widget.vegan);
                  widget.saveFilters(_filterData);
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

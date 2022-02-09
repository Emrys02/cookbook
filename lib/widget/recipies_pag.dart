import 'package:flutter/material.dart';

class Recipies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final details = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final pagetitle = details['title'];
    return Scaffold(
      appBar: AppBar(title: Text("$pagetitle")),
      body: Center(
        child: Text("Different Recipies"),
      ),
    );
  }
}

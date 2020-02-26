import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  /* final String title;
  final Color color;
  CategoryMealScreen(this.title, this.color);*/

  static const String routeName = "/meal_screen";

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context).settings.arguments as Map;
    final title = routeArguments['title'];
    final color = routeArguments['color'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          title,
          style:
              Theme.of(context).textTheme.title.copyWith(fontFamily: "Raleway"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal_details_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food"),
      ),
    );
  }
}

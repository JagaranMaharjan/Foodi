import 'package:flutter/material.dart';
import 'package:foodi/dummyData.dart';
import 'package:foodi/widgets/mealItems.dart';

class CategoryMealScreen extends StatelessWidget {
  /* final String title;
  final Color color;
  CategoryMealScreen(this.title, this.color);*/

  static const String routeName = "/meal_screen";

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context).settings.arguments as Map;
    final categoryTitle = routeArguments['title'];
    final categoryColor = routeArguments['color'];
    final categoryId = routeArguments['id'];

    final categoryMeals = DUMMY_MEALS
        .where(
          (meal) => meal.categories.contains(categoryId),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: categoryColor,
        title: Text(
          categoryTitle,
          style:
              Theme.of(context).textTheme.title.copyWith(fontFamily: "Raleway"),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => MealItems(
          id: categoryMeals[index].id,
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          affordability: categoryMeals[index].affordability,
          complexity: categoryMeals[index].complexity,
          duration: categoryMeals[index].duration,
        ),
        itemCount: categoryMeals.length,
      ),
    );
  }
}

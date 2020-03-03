import 'package:flutter/material.dart';
import 'package:foodi/models/meal.dart';
import 'package:foodi/widgets/mealItems.dart';

class FavouriteOverviewScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouriteOverviewScreen({this.favouriteMeals});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => MealItems(
        id: favouriteMeals[index].id,
        title: favouriteMeals[index].title,
        imageUrl: favouriteMeals[index].imageUrl,
        affordability: favouriteMeals[index].affordability,
        complexity: favouriteMeals[index].complexity,
        duration: favouriteMeals[index].duration,
      ),
      itemCount: favouriteMeals.length,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodi/dummyData.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal_details_screen";
  final Function toggleFavourite;
  final Function isFavourite;
  MealDetailsScreen(this.toggleFavourite, this.isFavourite);
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) {
        return meal.id == id;
      },
    );

    Widget _buildSectionTitle(String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget _buildSection(Widget child) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(20.0),
        height: 250,
        width: 300,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle("Ingredients"),
            _buildSection(
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    );
                  }),
            ),
            _buildSectionTitle("Steps"),
            _buildSection(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '#${index + 1}',
                          ),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                        ),
                      ),
                      Divider(
                        color: Colors.red,
                        thickness: 4,
                      ),
                    ],
                  );
                },
              ),
            ),
            FloatingActionButton(
              child: Icon(
                isFavourite(selectedMeal.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () => toggleFavourite(selectedMeal.id),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodi/dummyData.dart';
import 'package:foodi/models/meal.dart';
import 'package:foodi/widgets/mealItems.dart';

class CategoryMealScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoryMealScreen({this.availableMeals});
  /* final String title;
  final Color color;
  CategoryMealScreen(this.title, this.color);*/

  static const String routeName = "/meal_screen";

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  Color categoryColor;

  //--did changed dependency is used because widgets value are return after iniit state is called.--
  @override
  void didChangeDependencies() {
    final routeArguments = ModalRoute.of(context).settings.arguments as Map;
    categoryTitle = routeArguments['title'];
    categoryColor = routeArguments['color'];
    final categoryId = routeArguments['id'];

    //DUMMY_MEAL is replaced by availableMeals after filter
    categoryMeals = widget.availableMeals
        .where(
          (meal) => meal.categories.contains(categoryId),
        )
        .toList();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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

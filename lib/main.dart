import 'package:flutter/material.dart';
import 'package:foodi/dummyData.dart';
import 'package:foodi/overviewScreen/bottomBarScreen.dart';
import 'package:foodi/overviewScreen/categoryMealScreen.dart';
import 'package:foodi/overviewScreen/filterOverviewScreens.dart';
import 'package:foodi/overviewScreen/mealDetailsScreen.dart';
import 'package:foodi/overviewScreen/overviewScreen.dart';
import 'package:foodi/overviewScreen/tabViewScreen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegeterians": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  //for adding / removing favourite meals
  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(
        () {
          _favouriteMeals.removeAt(existingIndex);
        },
      );
    } else {
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  //check whether meal is in favourite category or not
  bool isMealFavourtite(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(
      () {
        _filters = filterData;
        _availableMeals = DUMMY_MEALS.where(
          (meal) {
            if (_filters["gluten"] && !meal.isGlutenFree) {
              return false;
            }
            if (_filters["lactose"] && !meal.isLactoseFree) {
              return false;
            }
            if (_filters["vegan"] && !meal.isVegan) {
              return false;
            }
            if (_filters["vegeterians"] && !meal.isVegetarian) {
              return false;
            }
            return true;
          },
        ).toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodi App',
      //home: ButtonBarScreen(), //TabViewScreen(),
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.cyan.shade50,
        fontFamily: "Roboto",
        brightness: Brightness.dark,
        canvasColor: Color.fromRGBO(175, 154, 129, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                //color: Color.fromRGBO(20, 51, 51, 1),
                color: Colors.white,
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(fontFamily: "Raleway", fontSize: 17),
            ),
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => ButtonBarScreen(_favouriteMeals),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(_toggleFavourite, isMealFavourtite),
        ButtonBarScreen.routeName: (ctx) => ButtonBarScreen(_favouriteMeals),
        FilterOverViewScreen.routeName: (ctx) => FilterOverViewScreen(
              setFilter: _setFilters, // to on/off switch
              currentFilters:
                  _filters, //to save current filters when switch is on/off
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoryOverviewScreen(),
        );
      },
    );
  }
}

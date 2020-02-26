import 'package:flutter/material.dart';
import 'package:foodi/overviewScreen/categoryMealScreen.dart';
import 'package:foodi/overviewScreen/overviewScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodi App',
      home: CategoryOverviewScreen(),
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
      routes: {
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
      },
    );
  }
}

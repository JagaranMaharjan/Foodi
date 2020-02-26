import 'package:flutter/material.dart';
import 'package:foodi/dummyData.dart';
import 'file:///D:/Flutter_Project_1/class_project/foodi/lib/widgets/categoryItem.dart';

class CategoryOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: const Text("Foodi App"),
      ),
      body: GridView(
        padding: EdgeInsets.all(30.0),
        children: DUMMY_CATEGORY.map(
          (catData) {
            return CategoryItem(
              title: catData.title,
              color: catData.color,
            );
          },
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3 / 2.9,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodi/overviewScreen/favouriteOverviewScreen.dart';
import 'package:foodi/overviewScreen/overviewScreen.dart';

class TabViewScreen extends StatefulWidget {
  @override
  _TabViewScreenState createState() => _TabViewScreenState();
}

class _TabViewScreenState extends State<TabViewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Foodi"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: "Categores",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favourites",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoryOverviewScreen(),
            FavouriteOverviewScreen(),
          ],
        ),
      ),
      length: 2,
      initialIndex: 0,
    );
  }
}

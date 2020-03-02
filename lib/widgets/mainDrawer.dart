import 'package:flutter/material.dart';
import 'package:foodi/overviewScreen/bottomBarScreen.dart';
import 'package:foodi/overviewScreen/filterOverviewScreens.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 200,
            width: double.infinity,
            child: Center(
              child: Text(
                "Welcome to foodi",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text("Meals"),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, ButtonBarScreen.routeName);
            },
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Filters"),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, FilterOverViewScreen.routeName);
            },
          ),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

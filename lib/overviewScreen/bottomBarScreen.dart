import 'package:flutter/material.dart';
import 'package:foodi/overviewScreen/favouriteOverviewScreen.dart';
import 'package:foodi/overviewScreen/overviewScreen.dart';
import 'package:foodi/widgets/mainDrawer.dart';

class ButtonBarScreen extends StatefulWidget {
  static const String routeName = "/buttonBarScreen";
  @override
  _ButtonBarScreenState createState() => _ButtonBarScreenState();
}

class _ButtonBarScreenState extends State<ButtonBarScreen> {
  final List<Map<String, Object>> _pages = [
    {"pages": CategoryOverviewScreen(), "title": "Categories"},
    {"pages": FavouriteOverviewScreen(), "title": "Favorites"}
  ];

  int _selectedScreen = 0;

  void _selectPage(int index) {
    setState(
      () {
        _selectedScreen = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedScreen]["title"]),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        fixedColor: Colors.red,
        elevation: 3,
        iconSize: 35,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        onTap: _selectPage,
        currentIndex: _selectedScreen,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorites"),
          ),
        ],
      ),
      body: _pages[_selectedScreen]['pages'],
    );
  }
}

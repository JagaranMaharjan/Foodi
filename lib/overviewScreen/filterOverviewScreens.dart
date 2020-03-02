import 'package:flutter/material.dart';
import 'package:foodi/widgets/mainDrawer.dart';

class FilterOverViewScreen extends StatefulWidget {
  static const String routeName = "filterOverviewScreen";
  final Function setFilter;
  final Map<String, bool> currentFilters; //to save current selected switch
  FilterOverViewScreen({this.setFilter, this.currentFilters});

  @override
  _FilterOverViewScreenState createState() => _FilterOverViewScreenState();
}

class _FilterOverViewScreenState extends State<FilterOverViewScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegeterian = false;
  bool _lactosefree = false;

  Widget _buildSwitchTile(
      {String title,
      String description,
      bool currentValue,
      Function valueUpdated}) {
    return Container(
      color: Colors.white,
      child: SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        onChanged: valueUpdated,
        activeColor: Colors.blue,
        value: currentValue,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree = widget.currentFilters["gluten"];
    _lactosefree = widget.currentFilters["lactose"];
    _vegan = widget.currentFilters["vegan"];
    _vegeterian = widget.currentFilters["vegeterians"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final filterData = {
                "gluten": _glutenFree,
                "lactose": _lactosefree,
                "vegan": _vegan,
                "vegeterians": _vegeterian,
              };
              widget.setFilter(filterData);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Adjust Your Filter Here !",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                  title: "Glutern Free",
                  description: "Only Gluten Free Are Selected",
                  currentValue: _glutenFree,
                  valueUpdated: (value) {
                    setState(
                      () {
                        _glutenFree = value;
                      },
                    );
                  },
                ),
                Divider(
                  color: Colors.transparent,
                  thickness: 1,
                ),
                _buildSwitchTile(
                  title: "Vegan",
                  description: "Only Vegan Are Selected",
                  currentValue: _vegan,
                  valueUpdated: (value) {
                    setState(
                      () {
                        _vegan = value;
                      },
                    );
                  },
                ),
                Divider(
                  color: Colors.transparent,
                  thickness: 1,
                ),
                _buildSwitchTile(
                  title: "Vegetrian",
                  description: "Only Vegetrian Food Are Selected",
                  currentValue: _vegeterian,
                  valueUpdated: (value) {
                    setState(
                      () {
                        _vegeterian = value;
                      },
                    );
                  },
                ),
                Divider(
                  color: Colors.transparent,
                  thickness: 1,
                ),
                _buildSwitchTile(
                  title: "Lactose Free",
                  description: "Only Lactose Free Are Selected",
                  currentValue: _lactosefree,
                  valueUpdated: (value) {
                    setState(
                      () {
                        _lactosefree = value;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

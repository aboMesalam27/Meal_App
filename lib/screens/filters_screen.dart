import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
 final  savefilter;
 final  _filters;
 FiltersScreen(this._filters,this.savefilter);
  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  @override
  void initState() {
     _glutenFree = widget._filters["GlutenFree"];
     _lactoseFree = widget._filters["LactoseFree"];
     _vegan = widget._filters["Vegan"];
     _vegetarian = widget._filters["Vegetarian"];
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed:(){
                final Map<String,bool> selectefFilter = {
                  "GlutenFree":_glutenFree,
                  "LactoseFree":_lactoseFree,
                  "Vegan":_vegan,
                  "Vegetarian":_vegetarian,
                };
                widget.savefilter(selectefFilter);
              },
              icon:Icon(Icons.save))
        ],
        title: Text("Your Filters"),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection.",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          Expanded(
              child: ListView(
            children: [
              BuildSwitch(
                  title: "Gluten-free",
                  subTitle: "only include Gluten-free meals.",
                  function: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  currentValue: _glutenFree),
              BuildSwitch(
                  title: "Lactose-free",
                  subTitle: "only include Lactose-free meals.",
                  function: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  currentValue: _lactoseFree),
              BuildSwitch(
                  title: "Vegan",
                  subTitle: "only include Vegan meals.",
                  function: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  currentValue: _vegan),
              BuildSwitch(
                  title: "Vegetarian",
                  subTitle: "only include Vegetarian meals.",
                  function: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  currentValue: _vegetarian),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  Widget BuildSwitch({
    required title,
    required subTitle,
    required function,
    required currentValue,
  }) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(subTitle),
        onChanged: function);
  }
}

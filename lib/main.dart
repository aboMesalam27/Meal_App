import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meal_app1/dummy_data.dart';
import 'package:meal_app1/models/meal.dart';
import 'package:meal_app1/screens/filters_screen.dart';
import 'package:meal_app1/screens/meal_details_screen.dart';
import 'package:meal_app1/screens/tabs_screen.dart';
import './screens/categories_meals_screens.dart';
import './screens/categories_screens.dart';
import 'package:flutter/scheduler.dart';
main()=>runApp(MealApp());
class MealApp extends StatefulWidget {
  const MealApp({Key? key}) : super(key: key);

  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {

  void setSlowAnimations() {
    timeDilation = .7;
  }
  Map<String,bool>_filters={
    "GlutenFree":false,
    "LactoseFree":false,
    "Vegan":false,
    "Vegetarian":false,
  };
  List<Meal>_avilableMeals=DUMMY_MEALS;
  List<Meal>_favoriteMeals=[];
  void _saveFilters(Map<String,bool> _filterDate){
    setState(() {
      _filters=_filterDate;
      _avilableMeals=DUMMY_MEALS.where((meal)  {
        if(_filters['GlutenFree']==true&& meal.isGlutenFree==false){
          return false;
        };
        if(_filters['LactoseFree']==true&& meal.isLactoseFree==false){
          return false;
        };
        if(_filters['Vegan']==true&& meal.isVegan==false){
          return false;
        };
        if(_filters['Vegetarian']==true&& meal.isVegetarian==false){
          return false;
        }return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId){
    final existingIndex=_favoriteMeals.indexWhere((meal) =>meal.id==mealId);
    if(existingIndex>=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }
   bool _isMealFav(String id){
    return _favoriteMeals.any((meal) => meal.id==id);
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Restaurant",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
       /// canvasColor: Color.fromRGBO(255,254, 229,1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            fontWeight: FontWeight.bold,
            color:const Color.fromRGBO(20,50, 50,1),
          ),
          bodyText2:const TextStyle(
            color:const Color.fromRGBO(20,50, 50,1),
          ),
          headline1: const TextStyle(
            fontSize: 19,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          ),
        )
      ),

      routes: {
        '/':(context)=> TabsScreen(_favoriteMeals),
        CategoriesMealScreen.routName:(context)=>CategoriesMealScreen(_avilableMeals),
        MealDetails.routName:(context)=>MealDetails(_toggleFavorite,_isMealFav),
        FiltersScreen.routeName:(context)=>FiltersScreen(_filters,_saveFilters),
      },
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal"),
      ),
      body: CategoriesScreens(),
    );
  }
}


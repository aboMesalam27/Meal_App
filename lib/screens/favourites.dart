import 'package:flutter/material.dart';
import 'package:meal_app1/models/meal.dart';
import 'package:meal_app1/widgets/meal_item.dart';
class Favourites extends StatelessWidget {
  final List<Meal>_favoriteMeals;


  Favourites(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(_favoriteMeals.isEmpty){
      return Center(
       child: Text("You have no favorite yet - start adding some!")
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favoriteMeals![index].id,
            imageUrl: _favoriteMeals![index].imageUrl,
            title: _favoriteMeals![index].title,
            duration: _favoriteMeals![index].duration,
            affordability: _favoriteMeals![index].affordability,

          );
        },
        itemCount: _favoriteMeals!.length,
      ) ;
    }
  }
}

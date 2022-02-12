import 'package:flutter/material.dart';
import 'package:meal_app1/models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routName = 'category_Meal';
  final List<Meal>_avilableMeals;
  CategoriesMealScreen(this._avilableMeals);
  @override
  _CategoriesMealScreenState createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  @override
  String? categoryTitle;
  List<Meal>? displayMeals;
  @override
  void didChangeDependencies() {
    final routeArgument =
    ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'];
    displayMeals= widget._avilableMeals.where((meal) {
      return meal.categories!.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
setState(() {
  displayMeals!.removeWhere((meal) => meal.id==mealId);
});
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("$categoryTitle")),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
         return MealItem(
           id: displayMeals![index].id,
           imageUrl: displayMeals![index].imageUrl,
           title: displayMeals![index].title,
           duration: displayMeals![index].duration,
           affordability: displayMeals![index].affordability,
           complexity: displayMeals![index].complexity,

         );
        },
        itemCount: displayMeals!.length,
      ),
    );
  }
}

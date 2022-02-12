import 'package:flutter/material.dart';
import 'package:meal_app1/dummy_data.dart';

class MealDetails extends StatelessWidget {
  Widget buildTextTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
  final  Function _toggleFavorite;
  final  Function _isMealFav;
  MealDetails(this._toggleFavorite,this._isMealFav);
  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  //const MealDetails({Key? key}) : super(key: key);
  static const routName = 'Meal_Detail';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text("${selectedMeal.title}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  "${selectedMeal.imageUrl}",
                  fit: BoxFit.cover,
                ),
              ),
              buildTextTitle(context, "Ingredients"),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text("${selectedMeal.ingredients![index]}"),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients!.length,
                ),
              ),
              buildTextTitle(context, "Steps"),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index + 1}"),
                        ),
                        title: Text("${selectedMeal.steps![index]}"),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  itemCount: selectedMeal.steps!.length,
                ),
              )
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            _isMealFav(mealId)?Icons.star:Icons.star_border
        ),
        onPressed:()=>_toggleFavorite(mealId),
      ),
    );
  }
}
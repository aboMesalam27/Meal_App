import 'package:flutter/material.dart';
import '../screens/categories_meals_screens.dart';

class CategoryItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Color color;
  CategoryItem(
    this.id,
    this.title,
    this.color,
  );
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoriesMealScreen.routName,
      arguments: <String,String?>{
      'id': id,
        'title':title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          "$title",
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.5), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  void selectCategory(BuildContext context) {
    Navigator.pushNamed(
      context,
      CategoryMealsScreen.routename,
      arguments: {
        'id' : id,
        'title' : title,
      }
    );
  }

  final String? id;
  final String? title;
  final Color? color;

  const CategoryItem({
    this.id,
    this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Center(
            child: Text(
          title!,
          style: Theme.of(context).textTheme.headline1,
        )),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
      ),
    );
  }
}

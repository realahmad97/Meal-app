
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';
class CategoryMealsScreen extends StatefulWidget {
  static const routename = 'category_meals_screen';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String?, String?>;
        final categoryId = routeArg['id'];
        final categoryTitle = routeArg['title'];
        final categoryMeals = DUMMY_MEALS.where((meal) {
          return meal.categories!.contains(categoryId);
        }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder:(context , index){
          return MealItem(
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        } ,
        itemCount: categoryMeals.length,
      ),
    );
  }
}

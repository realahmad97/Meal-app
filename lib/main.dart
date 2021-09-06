import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import './screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
       '/': (context) => CategoryScreen(),
        CategoryMealsScreen.routename : (context) => CategoryMealsScreen(),
        MealDetailScreen.routename : (context) => MealDetailScreen(),

      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 225, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
    );
  }
}

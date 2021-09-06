import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
class MealDetailScreen extends StatelessWidget {
   static const routename = 'meal_detail';
  const MealDetailScreen({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final String? mealid = ModalRoute.of(context)!.settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: AppBar(title: Text(selectedmeal.title!),),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selectedmeal.imageUrl!),
          )
        ]
      ),
    );
  }
}
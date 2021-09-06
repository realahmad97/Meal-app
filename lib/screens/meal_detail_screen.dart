import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routename = 'meal_detail';
  const MealDetailScreen({Key? key}) : super(key: key);
  Widget buildSictionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? mealid = ModalRoute.of(context)!.settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title!),
      ),
      body: SingleChildScrollView( // To scrolling page
        child: Column(children: [
          Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedmeal.imageUrl!)),
          buildSictionTitle('Inegradiant', context),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 150,
            width: 300,
            child: ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).accentColor,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selectedmeal.ingredients![index]),
                )),
              ),
              itemCount: selectedmeal.ingredients!.length,
            ),
          ),
          buildSictionTitle('Steps', context),
           // Steps +++++++++
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 150,
            width: 300,
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('#${index+1}'),
                      
                    ),
                    title: Text(selectedmeal.steps![index]),
                  ),
                  Divider(
                    height: 20,
                    color: Theme.of(context).primaryColor,
                    thickness: 3,
                  )
                ],
              ),
              itemCount: selectedmeal.steps!.length,
            ),
          ),
        ]),
      ),
    );
  }
}

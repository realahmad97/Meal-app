import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
String? get complexitytext{
  switch(complexity){
    case Complexity.Simple: return 'Simple'; break;
    case Complexity.Hard: return 'Hard'; break;
    case Complexity.Challenging: return 'Challinging'; break;
    default: return 'Unknown'; break;
  }
}

String? get affordabilitytext{
  switch(affordability){
    case Affordability.Affordable: return 'Affordable'; break;
    case Affordability.Pricey: return 'Pricey'; break;
    case Affordability.Luxurious: return 'Luxurious'; break;
    default: return 'Unknown'; break;
  }
}
  const MealItem({
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  void selectMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    color: Colors.black.withOpacity(0.3),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    width: 300,
                    child: Text(
                      title!,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row( //main row
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule,),
                      SizedBox(width: 6,),
                      Text('$duration min'),
                  ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work,),
                      SizedBox(width: 6,),
                      Text('$complexitytext'),
                  ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text('$affordabilitytext')
                  ],
                  )
                ],
              ),
            )
          ])),
    );
  }
}

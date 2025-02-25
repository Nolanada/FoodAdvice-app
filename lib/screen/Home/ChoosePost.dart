import 'package:flutter/material.dart';
import 'package:mobilefoodadviceapp/screen/Home/Advice.dart';
import 'package:mobilefoodadviceapp/screen/Home/Information/NutritionPage.dart';
import 'package:mobilefoodadviceapp/screen/Home/Information/foodClass.dart';
import 'package:mobilefoodadviceapp/screen/Home/Informations.dart';

class ChoosePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Option'),
      ),
      body: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/images/food_background.jpg'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdvicePost()));
                },
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Advice',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPost()));
                },
                child: Card(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Information',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



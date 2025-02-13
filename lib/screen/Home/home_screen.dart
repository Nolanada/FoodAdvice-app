import 'package:flutter/material.dart';
import 'package:mobilefoodadviceapp/screen/Authenticate/login_screen.dart';
import 'package:mobilefoodadviceapp/screen/Home/MealOptions_screen.dart';
import 'package:mobilefoodadviceapp/screen/Home/landing_screen.dart';
import 'package:mobilefoodadviceapp/screen/Home/product_Details.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ),
);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text("Home"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text('0')),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Text('Youpi')
        ],
      ),
    );
  }
}


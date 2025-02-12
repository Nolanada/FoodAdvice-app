import 'package:flutter/material.dart';

class NutritionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition and Diet App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nutrition Tracker'),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 150, // Adjust width based on progress
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Pie Chart'),
            // Add your pie chart widget here
            SizedBox(height: 20),
            Text('Bar Graph'),
            // Add your bar graph widget here
            BarGraph(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/rice.png', width: 50, height: 50),
                Image.asset('assets/lime.png', width: 50, height: 50),
                Image.asset('apples.png', width: 50, height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BarGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.green, // Customize color as needed
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 50, // Adjust height based on data
            width: 50,
            color: Colors.white, // Customize bar color
          ),
          SizedBox(height: 10),
          Container(
            height: 100, // Adjust height based on data
            width: 50,
            color: Colors.white, // Customize bar color
          ),
          SizedBox(height: 10),
          Container(
            height: 80, // Adjust height based on data
            width: 50,
            color: Colors.white, // Customize bar color
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RecipeDetails(),
  ));
}

class RecipeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutritional Tracking App'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Today's Calories: 1830 kcal",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: constraints.maxWidth < 600 ? 4 : 3,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: 50,
                            color: Colors.blue,
                            title: 'Salad',
                          ),
                          PieChartSectionData(
                            value: 150,
                            color: Colors.green,
                            title: 'Dinner',
                          ),
                          PieChartSectionData(
                            value: 50,
                            color: Colors.orange,
                            title: 'Mix',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: constraints.maxWidth < 600 ? 5 : 4,
                  child: Image.asset('assets/rice.png', fit: BoxFit.cover),
                ),
                Expanded(
                  flex: constraints.maxWidth < 600 ? 4 : 3,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Meal')),
                      DataColumn(label: Text('Calories')),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Salad')),
                        DataCell(Text('50')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Dinner')),
                        DataCell(Text('150')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Mix')),
                        DataCell(Text('50')),
                      ]),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nutritional Information:'),
                      Text('Protein 83%'),
                      Text('Fats 75%'),
                      Text('Carbs 65%'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
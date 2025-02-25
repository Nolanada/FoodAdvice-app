import 'package:flutter/material.dart';

// Model class for Advice
class Advice {
  final int number;
  final String content;
  int likes;

  Advice({required this.number, required this.content, required this.likes});
}

class SupperPage extends StatefulWidget {
  @override
  _SupperPageState createState() => _SupperPageState();
}

class _SupperPageState extends State<SupperPage> {
  // List of advices with an initial like count
  List<Advice> advices = [
    Advice(number: 1, content: 'Always stay positive!', likes: 0),
    Advice(number: 2, content: 'Eat healthy to stay strong!', likes: 0),
    Advice(number: 3, content: 'Exercise regularly to stay fit!', likes: 0),
    Advice(number: 4, content: 'Get enough sleep for better health!', likes: 0),
    Advice(number: 5, content: 'Keep learning and growing every day!', likes: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: advices.length,
      itemBuilder: (context, index) {
        // Access each advice in the list
        final advice = advices[index];

        return Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListTile(
            contentPadding: EdgeInsets.all(15),
            title: Text('Advice #${advice.number}', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(advice.content),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('Likes: ${advice.likes}', style: TextStyle(color: Colors.grey)),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.thumb_up, color: Colors.blue),
                      onPressed: () {
                        // Update the like count when button is pressed
                        setState(() {
                          if (advice.likes == 0){
                            advice.likes++;
                          }else{
                            advice.likes--;
                          }

                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

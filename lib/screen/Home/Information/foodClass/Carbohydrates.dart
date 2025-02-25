import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilefoodadviceapp/services/infos.dart';

class CarbohydratesPage extends StatefulWidget {
  @override
  _CarbohydratesPageState createState() => _CarbohydratesPageState();
  final InfoServices AdviceService = InfoServices();
}

class _CarbohydratesPageState extends State<CarbohydratesPage> {
  final CollectionReference postsCollection = FirebaseFirestore.instance.collection('posts');

  Future<void> updateLikes(String postId, int currentLikes) async {
    await postsCollection.doc(postId).update({'likes': currentLikes + 1});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: InfoServices().getCarbohydratesPost(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          Map<String, dynamic>? advice = snapshot.data;

          if (advice != null) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                title: Text('Advice #${advice['userName'] ?? 'N/A'}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(advice['content'] ?? 'No content available'),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text('Likes: ${advice['likes'] ?? 0}',
                            style: TextStyle(color: Colors.grey)),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.thumb_up, color: Colors.blue),
                          onPressed: () {
                            updateLikes(advice['id'] ?? '', advice['likes'] ?? 0);
                            setState(() {
                              // Update the UI to reflect the new likes count
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('No Carbohydrate information found.'));
          }
        }
      },
    );
  }
}
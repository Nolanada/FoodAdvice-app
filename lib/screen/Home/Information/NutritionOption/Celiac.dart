import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilefoodadviceapp/services/infos.dart';

import '../../../../services/favorites.dart';

class CeliacPage extends StatefulWidget {
  @override
  _CeliacPageState createState() => _CeliacPageState();
  final InfoServices AdviceService = InfoServices();
}

class _CeliacPageState extends State<CeliacPage> {
  final CollectionReference postsCollection = FirebaseFirestore.instance.collection('posts');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FavoritesService _favoritesService = FavoritesService();

  Future<void> updateLikes(String postId, int currentLikes) async {
    await postsCollection.doc(postId).update({'likes': currentLikes + 1});
  }

  Set<String> favoritePosts = Set<String>();

  void toggleFavorite(String postId) {
    String userId = _auth.currentUser!.uid;
    String favoriteKey = '$postId-$userId';

    if (favoritePosts.contains(favoriteKey)) {
      favoritePosts.remove(favoriteKey);
    } else {
      favoritePosts.add(favoriteKey);
      _favoritesService.addFavoritePost(userId, postId); // Add post to favorites in Firestore
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: postsCollection.where('category', isEqualTo: 'Celiac').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<DocumentSnapshot> posts = snapshot.data!.docs;

          if (posts.isNotEmpty) {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> post = posts[index].data() as Map<String, dynamic>; // Explicitly cast to Map<String, dynamic>
                String postId = post['id'];
                String userId = _auth.currentUser!.uid;
                String favoriteKey = '$postId-$userId';
                bool isFavorite = favoritePosts.contains(favoriteKey);
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    title: Text('Advice #${post['userName'] ?? 'N/A'}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post['content'] ?? 'No content available'),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Likes: ${post['likes'] ?? 0}',
                                style: TextStyle(color: Colors.grey)),
                            Spacer(),

                            IconButton(
                              icon: Icon(Icons.favorite, color: isFavorite ? Colors.red : Colors.grey),
                              onPressed: () {
                                toggleFavorite(postId);
                              },
                            ),

                            IconButton(
                              icon: Icon(Icons.thumb_up, color: Colors.blue),
                              onPressed: () {
                                updateLikes(post['id'] ?? '', post['likes'] ?? 0);
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
              },
            );
          } else {
            return Center(child: Text('No Celiac information found.'));
          }
        }
      },
    );
  }
}
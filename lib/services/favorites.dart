import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesService {
  // Assuming you have a Firestore instance initialized
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

// Function to add a favorite post for a user
  Future<void> addFavoritePost(String userId, String postId) async {
    CollectionReference favoritesCollection = firestore.collection('favorites');

    // Check if the user's document already exists in the favorites collection
    DocumentSnapshot userDoc = await favoritesCollection.doc(userId).get();

    if (!userDoc.exists) {
      // If the user document doesn't exist, create a new document
      await favoritesCollection.doc(userId).set({
        'favoritePosts': [postId],
      });
    } else {
      // If the user document exists, update the favoritePosts array
      List<dynamic> currentFavorites = (userDoc.data() as Map<String,
          dynamic>?)?['favoritePosts'] ?? [];
      if (!currentFavorites.contains(postId)) {
        currentFavorites.add(postId);
        await favoritesCollection.doc(userId).update({
          'favoritePosts': currentFavorites,
        });
      }
    }
  }

// Function to retrieve a user's favorite posts
  Stream<List<DocumentSnapshot>> getUserFavoritePostsStream(String userId) {
    StreamController<List<DocumentSnapshot>> controller = StreamController();

    firestore.collection('favorites').doc(userId).snapshots().listen((userDoc) {
      if (userDoc.exists) {
        Map<String, dynamic>? userData = userDoc.data() as Map<String,
            dynamic>?;

        if (userData != null && userData.containsKey('favoritePosts')) {
          List<String> favoritePostIds = List<String>.from(
              userData['favoritePosts']);
          List<DocumentSnapshot> favoritePosts = [];

          for (String postId in favoritePostIds) {
            firestore.collection('posts').doc(postId).get().then((
                postSnapshot) {
              if (postSnapshot.exists) {
                favoritePosts.add(postSnapshot);
                controller.add(favoritePosts);
              }
            });
          }
        } else {
          controller.add(
              []); // Return an empty list if 'favoritePosts' field is missing
        }
      } else {
        controller.add(
            []); // Return an empty list if user document doesn't exist
      }
    });

    return controller.stream;
  }
}
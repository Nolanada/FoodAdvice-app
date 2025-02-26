import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilefoodadviceapp/services/favorites.dart'; // Import your FirestoreService

class FavoriteItemsWidget extends StatelessWidget {
  final String userId;

  FavoriteItemsWidget(this.userId);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: FavoritesService().getUserFavoritePostsStream(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        List<DocumentSnapshot> favoriteItems = snapshot.data ?? [];
        if (favoriteItems.isEmpty) {
          return Center(child: Text('No favorite items found.'));
        }
        return ListView.builder(
          itemCount: favoriteItems.length,
          itemBuilder: (context, index) {
            final itemData = favoriteItems[index].data() as Map<String, dynamic>;
            return ListTile(
              title: Text(itemData['title']),
              // Add more UI elements here for each favorite item
            );
          },
        );
      },
    );
  }
}
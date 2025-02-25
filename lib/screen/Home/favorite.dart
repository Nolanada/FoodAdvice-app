import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobilefoodadviceapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilefoodadviceapp/services/auth.dart';
import 'package:flutter/material.dart';

import '../../services/favorites.dart';

class Preferences extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var uid = user.uid;
      return StreamProvider<QuerySnapshot?>.value(
        value: DatabaseService(uid: uid).preferenceStream,
        initialData: null,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Eat Healthy'),
            backgroundColor: Colors.grey[200],
            elevation: 0.0,
            actions: <Widget>[
              ElevatedButton.icon(
                icon: Icon(Icons.person),
                label: Text('Logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              )
            ],
          ),
          body: PreferenceList(userId: uid),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text('Please log in to view preferences.'),
        ),
      );
    }
  }
}

class PreferenceList extends StatelessWidget {
  final FavoritesService favoritesService = FavoritesService();
  final String userId;

  PreferenceList({required this.userId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: favoritesService.getUserFavoriteItemsStream(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error fetching data'));
        }
        List<DocumentSnapshot> favoriteItems = snapshot.data ?? [];
        return ListView.builder(
          itemCount: favoriteItems.length,
          itemBuilder: (context, index) {
            final itemData = favoriteItems[index].data() as Map<String, dynamic>;
            return ListTile(
              title: Text(itemData['title'] ?? 'No Title'),
              subtitle: Text(itemData['content'] ?? 'No Content'),
              // Add more UI elements here for each favorite item
            );
          },
        );
      },
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobilefoodadviceapp/screen/Home/preferences.dart';
import 'package:mobilefoodadviceapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobilefoodadviceapp/services/auth.dart';
import 'package:flutter/material.dart';


class preferences extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var uid = user.uid;
      return StreamProvider<QuerySnapshot<Object?>?>.value(
        value: DatabaseService(uid: uid).preferenceStream,
        initialData: (null),
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
          // body: PreferenceList(),
        ),
      );
    }
    else {
      // Handle the case where the user is not logged in
      // You can navigate to a login screen or show a message to log in
      return Scaffold(
        body: Center(
          child: Text('Please log in to view preferences.'),
        ),
      );
    }
  }
}

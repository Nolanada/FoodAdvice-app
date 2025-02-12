import 'package:flutter/material.dart';
import 'package:mobilefoodadviceapp/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  // const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

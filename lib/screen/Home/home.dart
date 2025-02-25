import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobilefoodadviceapp/screen/Home/ChoosePost.dart';
import 'package:mobilefoodadviceapp/screen/Home/Information/InfoOptions.dart';
import 'package:mobilefoodadviceapp/screen/Home/favorite.dart';
import 'package:mobilefoodadviceapp/screen/Home/preferences.dart';
import 'package:mobilefoodadviceapp/screen/Home/profilePage.dart';
import 'package:mobilefoodadviceapp/services/auth.dart';
import 'package:mobilefoodadviceapp/screen/Home/Advices/MealOptions_screen.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  // const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var user = FirebaseAuth.instance.currentUser;

    var uid = user?.uid;
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
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/hero2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.2),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChoosePost()));
                          },
                          child: Text("Create Content"),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoOptions()));
                        },
                        child: Card(
                          elevation: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/images/info.jpg',
                                  fit: BoxFit.cover, // Set the fit property to cover
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Information'),
                              ),
                            ],
                          ),
                        )
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MealOptions()));
                        },
                        child: Card(
                          elevation: 0,
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/images/advice3.jpg',
                                  fit: BoxFit.cover,
                                  height: 150, // Set a specific height for the image
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Advices'),
                              ),
                            ],
                          ),
                        )
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FavoriteItemsWidget(uid!), // Pass the user ID here
                            ),
                          );
                        },
                        child: Card(
                          elevation: 0,
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/images/preference.jpg',
                                  fit: BoxFit.cover,
                                  height: 150, // Set a specific height for the image
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Preferences'),
                              ),
                            ],
                          ),
                        )
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                        },
                        child: Card(
                          elevation: 0,
                          child: Column(
                            children: [
                              Image.asset('assets/images/preference1.jpg'),
                              Text('Profile Info'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

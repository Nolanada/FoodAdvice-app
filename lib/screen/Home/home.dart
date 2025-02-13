import 'package:flutter/material.dart';
import 'package:mobilefoodadviceapp/screen/Home/home_screen.dart';
import 'package:mobilefoodadviceapp/services/auth.dart';
import 'package:mobilefoodadviceapp/screen/Authenticate/login_screen.dart';
import 'package:mobilefoodadviceapp/screen/Home/MealOptions_screen.dart';
import 'package:mobilefoodadviceapp/screen/Home/landing_screen.dart';
import 'package:mobilefoodadviceapp/screen/Home/product_Details.dart';


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
                    image: AssetImage('assets/images/hero.jpg'),
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
                      Text("Welcome Nolan", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MealOptions()));
                        },
                        child: Text("Get Advice"),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetails()));
                      },
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            Image.asset('assets/apples.png'),
                            Text('Apples'),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                      },
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            Image.asset('assets/lime.png'),
                            Text('Lime'),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            Image.asset('assets/rice.png'),
                            Text('Rice'),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            Image.asset('assets/onboarding.jpg'),
                            Text('Onboarding'),
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

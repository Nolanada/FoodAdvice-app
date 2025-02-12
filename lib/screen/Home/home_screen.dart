import 'package:flutter/material.dart';
import 'package:mobilefoodadviceapp/screen/Authenticate/login_screen.dart';
import 'package:mobilefoodadviceapp/screen/Home/MealOptions_screen.dart';
import 'package:mobilefoodadviceapp/screen/Home/landing_screen.dart';
import 'package:mobilefoodadviceapp/screen/Home/product_Details.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ),
);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text("Home"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text('0')),
            ),
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

// class RecipeDetails extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Recipe Details'),
//       ),
//       body: Center(
//         child: Text('Recipe Details Page'),
//       ),
//     );
//   }
// }
//
// class SignUpPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: Center(
//         child: Text('Sign Up Page'),
//       ),
//     );
//   }
// }
//
// class SignIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In'),
//       ),
//       body: Center(
//         child: Text('Sign In Page'),
//       ),
//     );
//   }
// }
//
// class FoodOptions extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Food Options'),
//       ),
//       body: Center(
//         child: Text('Food Options Page'),
//       ),
//     );
//   }
// }
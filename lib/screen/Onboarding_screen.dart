import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:mobilefoodadviceapp/screen/Authenticate/login_screen.dart'; // Import the file where LoginPage is defined
import 'package:mobilefoodadviceapp/screen/Home/home_screen.dart';
import 'package:mobilefoodadviceapp/screen/Home/product_Details.dart';
// Import the file where LoginPage is defined

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/onboarding.jpg',
      'title': 'Welcome to MyApp',
      'description': 'Discover amazing features and functionalities.',
    },
    {
      'image': 'assets/hungry-man-dream-about-food-260nw-2130041669.jpg',
      'title': 'Get Started',
      'description': 'Sign up and start exploring the app today.',
    },
    {
      'image': 'assets/realistic-security.jpg',
      'title': 'Enjoy!',
      'description': 'Have a great experience using our app.',
    },
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: onboardingData.length,
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(onboardingData[index]['image']!),
              SizedBox(height: 20),
              Text(
                onboardingData[index]['title']!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                onboardingData[index]['description']!,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        //Modify It So that the Skip leads to Login
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );

              },
              child: Text('Skip'),
            ),
            //Modify it to lead to SignUpPage
            Row(
              children: List.generate(
                onboardingData.length,
                    (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mobilefoodadviceapp/services/auth.dart';
import 'package:animate_do/animate_do.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //Text param
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: Text('Sign In To Eat Healthy'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Container(
          child: Column(
            children: <Widget>[
              // Your existing code for the background image and layout
              Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeInUp(duration: Duration(seconds: 1), child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/light-1.png')
                            )
                        ),
                      )),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeInUp(duration: Duration(milliseconds: 1200), child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/light-2.png')
                            )
                        ),
                      )),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeInUp(duration: Duration(milliseconds: 1300), child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/clock.png')
                            )
                        ),
                      )),
                    ),
                    Positioned(
                      child: FadeInUp(duration: Duration(milliseconds: 1600), child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                        ),
                      )),
                    )
                  ],
                ),
              ),


              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    // Your existing code for the text fields
                    FadeInUp(duration: Duration(milliseconds: 1800), child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(143, 148, 251, 1)),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10)
                            )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1)))
                            ),
                            child: TextField(
                                onChanged: (val) {
                                  // Handle the onChanged event here
                                 setState(() => email = val);
                                },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email ",
                                  hintStyle: TextStyle(color: Colors.grey[700])
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(6.0),
                            child: TextField(
                              onChanged: (val) {
                                // Handle the onChanged event here
                                setState(() => password = val);
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),

                    SizedBox(height: 30),
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                          ),
                          onPressed: () async {
                            print(email);
                            print(password);

                            // String email = emailController.text;
                            // String password = passwordController.text;
                            //
                            // // dynamic result = await _auth.signInWithEmailPassword(email, password);
                            // if (result == null) {
                            //   print("An error occurred during sign-in");
                            // } else {
                            //   print('Signed In');
                            //   print(result);
                            //   Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                            // }
                          },

                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 70),
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                      ),
                    )
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

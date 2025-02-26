import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:mobilefoodadviceapp/services/auth.dart';

import '../../shared/loading.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({required this.toggleView});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String uname = '';
  String tel = '';
  String address = '';
  String error = '';

  // void register() async {
  //   print(email + password);
  //
  //   final auth = FirebaseAuth.instance;
  //   final response = await auth.createUserWithEmailAndPassword(email: email, password: password);
  //   print(response);
  // }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: Text('Join Us To Eat Healthy'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.login_outlined),
            label: Text('Sign In'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    // Your existing code for the background image and layout
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(143, 148, 251, 1)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(6.0),
                                child: TextFormField(
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Enter a username';
                                    }
                                    return null;
                                  },
                                  onChanged: (val) {
                                    setState(() => uname = val);
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Username",
                                    hintStyle: TextStyle(color: Colors.grey[700]),
                                  ),
                                ),
                              ),
                              Divider(
                                color :  Color.fromRGBO(143, 148, 251, 1),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Color.fromRGBO(143, 148, 251, 1))),
                                ),
                                child: TextFormField(
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Enter an email';
                                    }
                                    return null;
                                  },
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey[700]),
                                  ),
                                ),
                              ),
                              // Divider(
                              //   color :  Color.fromRGBO(143, 148, 251, 1),
                              // ),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                child: TextFormField(
                                  validator: (val) {
                                    if (val == null || val.length < 6) {
                                      return 'Enter at least a 6 character password';
                                    }
                                    return null;
                                  },
                                  onChanged: (val) {
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
                              Divider(
                                color :  Color.fromRGBO(143, 148, 251, 1),
                              ),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                child: TextFormField(
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Enter an address';
                                    }
                                    return null;
                                  },
                                  onChanged: (val) {
                                    setState(() => address = val);
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Address",
                                    hintStyle: TextStyle(color: Colors.grey[700]),
                                  ),
                                ),
                              ),
                              Divider(
                                color :  Color.fromRGBO(143, 148, 251, 1),
                              ),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                child: TextFormField(
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Enter a phone number';
                                      }
                                      return null;
                                    },
                                  onChanged: (val) {
                                    setState(() => tel = val);
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(color: Colors.grey[700]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

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
                            if (_formKey.currentState!.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth.registerWithEmail(email, password, uname, tel, address);
                              if (result == null) {
                                setState(() {
                                  error = 'Registration failed, please provide valid info';
                                  loading = false;
                                });
                              }
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                    SizedBox(height: 70),
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
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
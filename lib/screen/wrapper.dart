import 'package:flutter/material.dart';
import 'package:mobilefoodadviceapp/models/user.dart';
import 'package:mobilefoodadviceapp/screen/Authenticate/authenticate.dart';
import 'package:mobilefoodadviceapp/screen/Home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final testUser = Provider.of<Users?>(context);
    // Return either home or Authenticate widget based on user authentication status
    return testUser != null ? Home() : Authenticate();
  }
}

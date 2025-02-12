import 'package:flutter/material.dart';
import 'package:mobilefoodadviceapp/models/user.dart';
import 'package:mobilefoodadviceapp/screen/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobilefoodadviceapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(options: DefaultFirebaseOptions.web);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      value: AuthService().getUserData(),
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

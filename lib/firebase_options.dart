// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCuoseR9WJy1EW5njw8pMEeHNXWs9FBMgg',
    appId: '1:272064639271:web:5760d8656dd8d262813902',
    messagingSenderId: '272064639271',
    projectId: 'mobilefoodadviceapp-58037',
    authDomain: 'mobilefoodadviceapp-58037.firebaseapp.com',
    storageBucket: 'mobilefoodadviceapp-58037.firebasestorage.app',
    measurementId: 'G-WMCY3G1M0M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDS7Usz-QtUZ9hoqCGddSln2nTYZsrNfjc',
    appId: '1:272064639271:android:b7afbf3067830dcf813902',
    messagingSenderId: '272064639271',
    projectId: 'mobilefoodadviceapp-58037',
    storageBucket: 'mobilefoodadviceapp-58037.firebasestorage.app',
  );
}

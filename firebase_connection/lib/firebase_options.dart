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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDJeo9P-g7Ixw1ARixpQzopaCa1d0TKR5I',
    appId: '1:668337462449:web:7f949f0423d909402c9690',
    messagingSenderId: '668337462449',
    projectId: 'fir-14960',
    authDomain: 'fir-14960.firebaseapp.com',
    storageBucket: 'fir-14960.appspot.com',
    measurementId: 'G-70MXCG3M2T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZNdZhi7YMXzSk7zN4UKLV2IZR7A059sc',
    appId: '1:668337462449:android:4534e9ca2bf7f6892c9690',
    messagingSenderId: '668337462449',
    projectId: 'fir-14960',
    storageBucket: 'fir-14960.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDB7xEMgvAP3rCvPqnHT_UIWYxG_Y7oA1I',
    appId: '1:668337462449:ios:bd2c6a13ccf0ca062c9690',
    messagingSenderId: '668337462449',
    projectId: 'fir-14960',
    storageBucket: 'fir-14960.appspot.com',
    iosBundleId: 'com.example.firebaseConnection',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDB7xEMgvAP3rCvPqnHT_UIWYxG_Y7oA1I',
    appId: '1:668337462449:ios:bd2c6a13ccf0ca062c9690',
    messagingSenderId: '668337462449',
    projectId: 'fir-14960',
    storageBucket: 'fir-14960.appspot.com',
    iosBundleId: 'com.example.firebaseConnection',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDJeo9P-g7Ixw1ARixpQzopaCa1d0TKR5I',
    appId: '1:668337462449:web:0b24db3257bdaed02c9690',
    messagingSenderId: '668337462449',
    projectId: 'fir-14960',
    authDomain: 'fir-14960.firebaseapp.com',
    storageBucket: 'fir-14960.appspot.com',
    measurementId: 'G-8PSRGNPQ1V',
  );
}

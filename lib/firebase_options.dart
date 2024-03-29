// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBb1rx4_qmpLiwp4V2e7NUZ0a5XGPH81Gk',
    appId: '1:199879290891:web:36193c9d1340076380d70e',
    messagingSenderId: '199879290891',
    projectId: 'internship-raion-e234a',
    authDomain: 'internship-raion-e234a.firebaseapp.com',
    storageBucket: 'internship-raion-e234a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDe2u8fd1KUcrt4ljrE_58hRql9tY6DVIg',
    appId: '1:199879290891:android:c3625003e05336a180d70e',
    messagingSenderId: '199879290891',
    projectId: 'internship-raion-e234a',
    storageBucket: 'internship-raion-e234a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKMDjHEdhzLTgYe0jZmPMpHF0PZu0JhUM',
    appId: '1:199879290891:ios:9abb5594dba38f1080d70e',
    messagingSenderId: '199879290891',
    projectId: 'internship-raion-e234a',
    storageBucket: 'internship-raion-e234a.appspot.com',
    iosBundleId: 'com.example.internshipRaion',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKMDjHEdhzLTgYe0jZmPMpHF0PZu0JhUM',
    appId: '1:199879290891:ios:1449f0faf20b4d5680d70e',
    messagingSenderId: '199879290891',
    projectId: 'internship-raion-e234a',
    storageBucket: 'internship-raion-e234a.appspot.com',
    iosBundleId: 'com.example.internshipRaion.RunnerTests',
  );
}

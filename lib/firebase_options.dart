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
    apiKey: 'AIzaSyDkBaUGoi2XdAFVb4ZlgxxN_mHF3tHjN_4',
    appId: '1:40220344734:web:65b8069e23f4a2b158d68f',
    messagingSenderId: '40220344734',
    projectId: 'todeyapp',
    authDomain: 'todeyapp.firebaseapp.com',
    storageBucket: 'todeyapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDc4aCA0QYuP7Ira0nno4xebviuyakxVEw',
    appId: '1:40220344734:android:084e0a32449e8ff658d68f',
    messagingSenderId: '40220344734',
    projectId: 'todeyapp',
    storageBucket: 'todeyapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXhKfB-A6_RatUpoI1aN1j9fF7LDn4jXY',
    appId: '1:40220344734:ios:29039a6e4f62322e58d68f',
    messagingSenderId: '40220344734',
    projectId: 'todeyapp',
    storageBucket: 'todeyapp.appspot.com',
    iosClientId: '40220344734-7gvlprue05qs6hmcs553jq5k1ns5djp9.apps.googleusercontent.com',
    iosBundleId: 'com.flutterboyfriend.todey',
  );
}

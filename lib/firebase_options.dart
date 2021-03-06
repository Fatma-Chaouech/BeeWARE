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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-iZ320nHOyIm7FKdjxh0G3H8WxCZnX4A',
    appId: '1:600371674389:android:9ecad811c092c8936bfd1c',
    messagingSenderId: '600371674389',
    projectId: 'habee-35716',
    databaseURL: 'https://habee-35716-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'habee-35716.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUxk1aU-b4paCuDSd7bDXez1Nag5mO9BY',
    appId: '1:600371674389:ios:d905dd99c60da13b6bfd1c',
    messagingSenderId: '600371674389',
    projectId: 'habee-35716',
    databaseURL: 'https://habee-35716-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'habee-35716.appspot.com',
    iosClientId: '600371674389-82ddo62jibhutne1sdo8mhajjaguj1hu.apps.googleusercontent.com',
    iosBundleId: 'com.example.bee',
  );
}

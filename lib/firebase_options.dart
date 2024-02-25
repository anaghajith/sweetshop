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
    apiKey: 'AIzaSyCFNsZo6Zmm6jPzCQ0a4oUIAeH8klEW4ro',
    appId: '1:844730011285:web:5c5839c7fa4a5cbaab159c',
    messagingSenderId: '844730011285',
    projectId: 'sweetshop-a6ff9',
    authDomain: 'sweetshop-a6ff9.firebaseapp.com',
    storageBucket: 'sweetshop-a6ff9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDo_jokOvqkNvGS0-nWHJPYer8XzEglrI4',
    appId: '1:844730011285:android:2f3e21fb855c3165ab159c',
    messagingSenderId: '844730011285',
    projectId: 'sweetshop-a6ff9',
    storageBucket: 'sweetshop-a6ff9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbC2Qg0o2KX8unLuAY4xuc-d6dK5wULhM',
    appId: '1:844730011285:ios:9abe22033c421df8ab159c',
    messagingSenderId: '844730011285',
    projectId: 'sweetshop-a6ff9',
    storageBucket: 'sweetshop-a6ff9.appspot.com',
    iosBundleId: 'com.example.sweetshop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbC2Qg0o2KX8unLuAY4xuc-d6dK5wULhM',
    appId: '1:844730011285:ios:89e190b84422b3eaab159c',
    messagingSenderId: '844730011285',
    projectId: 'sweetshop-a6ff9',
    storageBucket: 'sweetshop-a6ff9.appspot.com',
    iosBundleId: 'com.example.sweetshop.RunnerTests',
  );
}

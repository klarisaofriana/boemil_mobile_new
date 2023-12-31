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
    apiKey: 'AIzaSyC5xifHFcbtvFnO3n6nGcDNaI59KlUPT5k',
    appId: '1:1073555680675:web:41a32d8988625afc6bfe16',
    messagingSenderId: '1073555680675',
    projectId: 'boemil-562bf',
    authDomain: 'boemil-562bf.firebaseapp.com',
    storageBucket: 'boemil-562bf.appspot.com',
    measurementId: 'G-SWJK72ZNG9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAGnfG89_WgW8Eiehyrb-xD-6q2LjfUr0',
    appId: '1:1073555680675:android:21599b41146a7f7c6bfe16',
    messagingSenderId: '1073555680675',
    projectId: 'boemil-562bf',
    storageBucket: 'boemil-562bf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1UVBWPOaGi3ayhZIzywXXbCfylaCJ8xQ',
    appId: '1:1073555680675:ios:17a341003ff300786bfe16',
    messagingSenderId: '1073555680675',
    projectId: 'boemil-562bf',
    storageBucket: 'boemil-562bf.appspot.com',
    iosBundleId: 'com.example.boemilMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1UVBWPOaGi3ayhZIzywXXbCfylaCJ8xQ',
    appId: '1:1073555680675:ios:f15ece55de0622f16bfe16',
    messagingSenderId: '1073555680675',
    projectId: 'boemil-562bf',
    storageBucket: 'boemil-562bf.appspot.com',
    iosBundleId: 'com.example.boemilMobile.RunnerTests',
  );
}

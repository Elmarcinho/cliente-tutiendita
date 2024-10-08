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
    apiKey: 'AIzaSyCmUMVpbLHvhhNW596XzXAyvj4WDRaTmgM',
    appId: '1:791320512731:web:649ea3155a3920449364fe',
    messagingSenderId: '791320512731',
    projectId: 'admin-tutiendita-f014f',
    authDomain: 'admin-tutiendita-f014f.firebaseapp.com',
    storageBucket: 'admin-tutiendita-f014f.appspot.com',
    measurementId: 'G-QVECG961DH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiGH_w--AzsZOurYrIHkfhTdNDuda9hnA',
    appId: '1:791320512731:android:47192ecd0ae357609364fe',
    messagingSenderId: '791320512731',
    projectId: 'admin-tutiendita-f014f',
    storageBucket: 'admin-tutiendita-f014f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvK7RlihFw0AS8Bv0Dfu4xH2vKvw7wkeY',
    appId: '1:791320512731:ios:377b1d006c6a28b39364fe',
    messagingSenderId: '791320512731',
    projectId: 'admin-tutiendita-f014f',
    storageBucket: 'admin-tutiendita-f014f.appspot.com',
    iosBundleId: 'com.example.clienteTutiendita',
  );
}

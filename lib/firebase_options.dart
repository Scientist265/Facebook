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
    apiKey: 'AIzaSyCrhA28Wg8_3wwQQPSFASON1FyMz5lBsEU',
    appId: '1:400094038543:web:6e68394bb0f9c2e597b17a',
    messagingSenderId: '400094038543',
    projectId: 'facebook-clone-project-e5889',
    authDomain: 'facebook-clone-project-e5889.firebaseapp.com',
    storageBucket: 'facebook-clone-project-e5889.appspot.com',
    measurementId: 'G-DWWF8KF2V1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5qy_TuF9qXbjJzsu4DaaODlAdvdOutqo',
    appId: '1:400094038543:android:f9d93f04a29e56f397b17a',
    messagingSenderId: '400094038543',
    projectId: 'facebook-clone-project-e5889',
    storageBucket: 'facebook-clone-project-e5889.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXJe9stBWci8EPiuXhkEQmHzNOzOEuzsQ',
    appId: '1:400094038543:ios:653c24042c6af95797b17a',
    messagingSenderId: '400094038543',
    projectId: 'facebook-clone-project-e5889',
    storageBucket: 'facebook-clone-project-e5889.appspot.com',
    iosBundleId: 'com.example.facebookClo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXJe9stBWci8EPiuXhkEQmHzNOzOEuzsQ',
    appId: '1:400094038543:ios:734c6faf4547559e97b17a',
    messagingSenderId: '400094038543',
    projectId: 'facebook-clone-project-e5889',
    storageBucket: 'facebook-clone-project-e5889.appspot.com',
    iosBundleId: 'com.example.facebookClo.RunnerTests',
  );
}
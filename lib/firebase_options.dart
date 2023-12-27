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
    apiKey: 'AIzaSyDAZLG50tIylDPgGE_h-0gKhmsr1v056N8',
    appId: '1:820653884224:web:d6997b0368d51ca7e7f0a5',
    messagingSenderId: '820653884224',
    projectId: 'facebook-clone-98cb4',
    authDomain: 'facebook-clone-98cb4.firebaseapp.com',
    storageBucket: 'facebook-clone-98cb4.appspot.com',
    measurementId: 'G-68663Z54H7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkbE36M5maZqpDCha19jJmoWMsdMhE7RM',
    appId: '1:820653884224:android:bcbbf99becc742b5e7f0a5',
    messagingSenderId: '820653884224',
    projectId: 'facebook-clone-98cb4',
    storageBucket: 'facebook-clone-98cb4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAu40kTE83nHJpQnFcEDV9qGMrhw8g451g',
    appId: '1:820653884224:ios:374ebd8091b1c406e7f0a5',
    messagingSenderId: '820653884224',
    projectId: 'facebook-clone-98cb4',
    storageBucket: 'facebook-clone-98cb4.appspot.com',
    iosBundleId: 'com.example.facebookClo',
  );
}

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
    apiKey: 'AIzaSyAUL3f4EWrs0PeFt6EAB7TuuBYqJ9GDymI',
    appId: '1:532886439020:android:c57833641d5fefcec58449',
    messagingSenderId: '532886439020',
    projectId: 'unearthed2-5343a',
    storageBucket: 'unearthed2-5343a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCo_erOILlJmrIfAUoipR1VoYSLyxukE8k',
    appId: '1:532886439020:ios:3198a3e9443f5809c58449',
    messagingSenderId: '532886439020',
    projectId: 'unearthed2-5343a',
    storageBucket: 'unearthed2-5343a.appspot.com',
    androidClientId: '532886439020-au4f5r1p71ve1cf99fh2ph2mkahvdc57.apps.googleusercontent.com',
    iosClientId: '532886439020-n067nc99esfalbn0nqi8ivimjf3nmpus.apps.googleusercontent.com',
    iosBundleId: 'com.example.unearthed',
  );

}
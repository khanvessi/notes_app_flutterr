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
    apiKey: 'AIzaSyB8747Uq_lYmI9OtIMAy_9w1TAsCK8Y7V8',
    appId: '1:370003040681:android:644bec99d5c3a304a80cb8',
    messagingSenderId: '370003040681',
    projectId: 'mynotes-flutter-project-demo1',
    storageBucket: 'mynotes-flutter-project-demo1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCK6s4Cy1Jha2zAwPNSNY4HFKvrZuG0Eo',
    appId: '1:370003040681:ios:aca4502ae6f1f421a80cb8',
    messagingSenderId: '370003040681',
    projectId: 'mynotes-flutter-project-demo1',
    storageBucket: 'mynotes-flutter-project-demo1.appspot.com',
    iosClientId: '370003040681-d2uc36otin3bbtnl7gk4hv0p8p3oc9s3.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesApp',
  );
}

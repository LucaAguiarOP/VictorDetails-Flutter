import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyABkRxo73wEwOBnP0ez8j3D6G4L9tUmQ14',
    appId: '1:207586470223:web:bc9d7f29583db07a283d3a',
    messagingSenderId: '207586470223',
    projectId: 'victordetails-50eef',
    authDomain: 'victordetails-50eef.firebaseapp.com',
    storageBucket: 'victordetails-50eef.appspot.com',
    measurementId: 'G-ZTRJ3Q0FWH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZz9wtyFSqn9Vd8RDHGLvxErBxKQp53sw',
    appId: '1:207586470223:android:6aaa2efd23883531283d3a',
    messagingSenderId: '207586470223',
    projectId: 'victordetails-50eef',
    storageBucket: 'victordetails-50eef.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfaIWCHTUZB68zkNiLKTmf5lkPIQmemHU',
    appId: '1:207586470223:ios:be7e93c397417ed0283d3a',
    messagingSenderId: '207586470223',
    projectId: 'victordetails-50eef',
    storageBucket: 'victordetails-50eef.appspot.com',
    iosBundleId: 'com.example.victordetailsflutter',
  );
}

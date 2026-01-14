import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCqpicP83wpnKEVdHN0OxoeEMGNsQlOoNA',
    authDomain: 'situmbuh-dac3a.firebaseapp.com',
    projectId: 'situmbuh-dac3a',
    storageBucket: 'situmbuh-dac3a.firebasestorage.app',
    messagingSenderId: '227327125872',
    appId: '1:227327125872:web:95f279b7472cb53d3d47b5',
    measurementId: 'G-XPGSL2Z2GG',
  );
}

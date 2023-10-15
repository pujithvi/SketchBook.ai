import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC0jowuwEgpZW6d9FKd7S673HIimrvBwBA",
            authDomain: "sketchbook-eadcd.firebaseapp.com",
            projectId: "sketchbook-eadcd",
            storageBucket: "sketchbook-eadcd.appspot.com",
            messagingSenderId: "1044942354361",
            appId: "1:1044942354361:web:0082b8ce453e0f39012868",
            measurementId: "G-RYJF34M5EC"));
  } else {
    await Firebase.initializeApp();
  }
}

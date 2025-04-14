import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: kIsWeb
          ? const FirebaseOptions(
        apiKey: "AIzaSyCx67QK31ukRvJpJYYcDHlgzvm4M0zmAEo",
        authDomain: "mobiledev-eeafa.firebaseapp.com",
        projectId: "mobiledev-eeafa",
        storageBucket: "mobiledev-eeafa.appspot.com",
        messagingSenderId: "960950703785",
        appId: "1:960950703785:web:0af80f1383e1820889fbb8",
      ) : null,
    );
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}

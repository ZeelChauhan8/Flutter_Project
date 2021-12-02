import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/splash_screen.dart';

Future<void> main() async {
//  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Color kPrimaryColor = Color.fromRGBO(55, 105, 151, 1);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "eshop",
      home: SplashScreen(),
    ),
  );
}

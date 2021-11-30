import 'package:flutter/material.dart';
import 'package:project/splash_screen.dart';

void main() {
//  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "eshop",
      home: SplashScreen(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:project/splash_screen.dart';

void main() {
//  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  Color kPrimaryColor = Color.fromRGBO(55, 105, 151, 1);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "eshop",
      home: SplashScreen(),
    ),
  );
}

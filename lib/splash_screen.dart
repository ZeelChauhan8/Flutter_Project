import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project/home_page.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreen_State();
  }
}
class SplashScreen_State extends State<SplashScreen> {
  // Future<void> fetch_login() async
  // {
  //   SharedPreferences pref=await SharedPreferences.getInstance();
  //   var email = pref.getString('email');
  //
  // }
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "images/instagram.png",
            height: 150,
            width: 150,
          ),
          Text(
            "e-shop",
            style: TextStyle(
                fontSize: 30, color: Colors.green, fontFamily: 'fontr'),
          ),
          CircularProgressIndicator(
            color: Colors.green,
          ),
          LinearProgressIndicator(
            color: Colors.green,
          )
        ],
      )),
    );
  }
}

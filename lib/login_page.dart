import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreen_State();
  }
}

class LoginScreen_State extends State<LoginScreen> {
  List _cus = [];
  Future<void> fetch_customer() async {
    final String json_cus = await rootBundle.loadString("api/product.json");
    final data = await json.decode(json_cus);
    setState(() {
      _cus = data['customer'];
    });
  }

  void loginverify() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int count = 0;
    for (int i = 0; i < _cus.length; i++) {
      if (uname == _cus[i]['c_email'] && password == _cus[i]['c_pass']) {
        count = 1;
        prefs.setString('email', uname);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Welcome  " + _cus[i]['c_name']),
        ));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
    if (count == 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid Email id or Password"),
      ));
    }
  }

  // var a=LinearProgressIndicator(color:Colors.green);
  bool _mask = true;
  String uname = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    fetch_customer();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Login Page"),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          height: 400.0,
          width: 400.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Login Screen",
                    style: TextStyle(
                        fontFamily: "oswald",
                        color: Colors.green,
                        fontSize: 30),
                  )),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Username",
                      hintText: "Enter Username",
                      suffixIcon: Icon(Icons.account_circle)),
                  onChanged: (uname) {
                    setState(() {
                      this.uname = uname;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  obscureText: _mask,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: "Enter Password",
                      suffixIcon: IconButton(
                        splashColor: Colors.green,
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            _mask = !_mask;
                          });
                        },
                      )),
                  onChanged: (val) {
                    setState(() {
                      this.password = val;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: RaisedButton(
                  padding:
                      EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 20),
                  onPressed: loginverify,
                  color: Colors.green,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 5,
                        fontFamily: "oswald",
                        color: Colors.white),
                  ),
                  // color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

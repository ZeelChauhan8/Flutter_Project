import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/bottom_nav_pages.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
//  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Project",
      home:SplashScreen(),
  ),
  );
}
class SplashScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return SplashScreen_State();
  }
}
class SplashScreen_State extends State<SplashScreen>
{
  // Future<void> fetch_login() async
  // {
  //   SharedPreferences pref=await SharedPreferences.getInstance();
  //   var email = pref.getString('email');
  //
  // }
  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 2),
            () =>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>
            HomePage()
        )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
        body: Center(
            child:Column(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("images/instagram.png",height: 150,width: 150,),
                Text("Instagram by Zeel",style: TextStyle(fontSize: 30,color:Colors.green,fontFamily: 'fontr'),),
                CircularProgressIndicator(color: Colors.green,),
                LinearProgressIndicator(color: Colors.green,)
              ],
            )
        ),
    );
  }
}
class LoginScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
      return LoginScreen_State();
  }
}
class LoginScreen_State extends State<LoginScreen>
{
  List _cus=[];
  Future<void> fetch_customer() async
  {
    final String json_cus=await rootBundle.loadString("api/product.json");
    final data=await json.decode(json_cus);
    setState(() {
      _cus=data['customer'];
    });
  }
  void loginverify() async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int count=0;
        for(int i=0;i<_cus.length;i++)
        {
          if (uname == _cus[i]['c_email'] && password == _cus[i]['c_pass']) {
            count=1;
            prefs.setString('email', uname);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Welcome  "+_cus[i]['c_name']),
                ));
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        }
     if(count==0){
          ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("Invalid Email id or Password"),));
      }


  }
 // var a=LinearProgressIndicator(color:Colors.green);
  bool _mask=true;
  String uname="";
  String password="";
  @override
  Widget build(BuildContext context) {
    fetch_customer();
      return Scaffold(
        appBar: AppBar(title: Center(child :Text("Login Page"),),backgroundColor: Colors.green,),

        body:Center(
          child:Container(
            height: 400.0,
            width: 400.0,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(margin :EdgeInsets.all(20),child: Text("Login Screen",style: TextStyle(fontFamily: "oswald",color:Colors.green,fontSize: 30),)),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration: InputDecoration(

                        border:OutlineInputBorder(),
                        labelText: "Username",
                        hintText: "Enter Username",
                        suffixIcon: Icon(Icons.account_circle)
                    ),
                    onChanged: (uname)
                    {
                      setState(() {
                        this.uname=uname;
                      });
                    },
                  ),
                ),
                Container(
                  margin:EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    obscureText: _mask,
                    decoration: InputDecoration(
                        border:OutlineInputBorder(),
                        labelText: "Password",
                        hintText: "Enter Password",
                        suffixIcon: IconButton(splashColor: Colors.green,icon:Icon(Icons.remove_red_eye),onPressed: (){
                          setState(() {
                            _mask=!_mask;
                          });
                        },)
                    ),
                    onChanged: (val)
                    {
                      setState(() {
                        this.password=val;
                      });
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    padding: EdgeInsets.only(top: 20,left: 40,right: 40,bottom: 20) ,
                    onPressed:loginverify,
                    color: Colors.green,
                    child: Text("Login",style: TextStyle(fontSize: 20,letterSpacing: 5,fontFamily:"oswald",color: Colors.white),),
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

class HomePage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return HomePage_State();
  }
}
class HomePage_State extends State<HomePage>
{
  var _page=[Home(),Search(),About(),Settings(),Profile()];
  int _SelectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:_page[_SelectedIndex],
      ),
      bottomNavigationBar: ConvexAppBar(
        //type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.lightGreen,
        activeColor: Colors.white,
        style: TabStyle.reactCircle,
        //selectedItemColor: Colors.red,
        //showUnselectedLabels: true,
        //unselectedItemColor: Colors.black,
        items: [
          TabItem(icon: Icon(Icons.home,color: Colors.red,),title: "Home",),
          TabItem(icon: Icon(Icons.search,color: Colors.deepOrange,),title: "Search",),
          TabItem(icon: Icon(Icons.add,color: Colors.black,),title: "Products",),
          TabItem(icon: Icon(Icons.shopping_cart,color: Colors.blue,),title: "Cart",),
          TabItem(icon: Icon(Icons.supervised_user_circle,color: Colors.cyanAccent,),title: "Profile",)
        ],
        onTap: (setval){
          setState(() {
            _SelectedIndex=setval;
          });
        },
      ),
    );
  }
}

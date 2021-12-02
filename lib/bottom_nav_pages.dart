//import 'dart:html';

import 'dart:convert';
import 'package:project/home_page.dart';
import 'package:project/login_page.dart';
import 'package:shimmer/shimmer.dart';

//import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:carousel_slider/carousel_slider.dart';

//width: MediaQuery.of(context).size.width
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Home_State();
  }
}

class Home_State extends State<Home> {
  List _product = [];
  Future<void> fetch_pro() async {
    final String jsonres = await rootBundle.loadString("api/product.json");
    final data = await json.decode(jsonres);
    setState(() {
      _product = data['Product'];
    });
  }

  @override
  Widget build(BuildContext context) {
    fetch_pro();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Page", style: TextStyle(fontFamily: "fontr")),
        ),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
            icon: Icon(
              Icons.mic,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.account_circle_outlined, color: Colors.white)),
        ],
      ),

      //extendBodyBehindAppBar: true,
      drawer: Drawer(
        elevation: 20,
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              color: Colors.deepPurpleAccent,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://yt3.ggpht.com/yti/APfAmoGG2wndeEtxJjmmLb8mEMocL6jMcmQdspdq5LiaeQ=s108-c-k-c0x00ffffff-no-rj",
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "zeel123@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    "Zeel Chauhan",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text(
                      "Home",
                      style: TextStyle(fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.shop),
                    title: Text(
                      "Shop",
                      style: TextStyle(fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Shop()));
                    },
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(4),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
            height: 170.0,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                viewportFraction: 0.8,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
              ),
              items: [
                Image.asset('images/slider/m1.jpeg', fit: BoxFit.fill),
                Image.asset('images/slider/m2.jpg', fit: BoxFit.fill),
                Image.asset('images/slider/3.jpg', fit: BoxFit.fill),
                Image.asset('images/slider/4.jpg', fit: BoxFit.fill),
                Image.asset('images/slider/5.jpg', fit: BoxFit.fill),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              "Category",
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
              color: Colors.black12,
              height: 200,
              margin: EdgeInsets.only(top: 5),
              child: ListView(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      height: 200,
                      width: 150,
                      color: Colors.black12,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            'images/category/phone.jpg',
                            height: 150,
                            width: 90,
                          ),
                          Text("Phone",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      )),
                  Container(
                      height: 200,
                      width: 150,
                      color: Colors.black12,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            'images/category/shirt.jpg',
                            height: 150,
                            width: 90,
                          ),
                          Text("Shirt",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      )),
                  Container(
                      height: 200,
                      width: 150,
                      color: Colors.black12,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            'images/category/tshirt.jpg',
                            height: 150,
                            width: 90,
                          ),
                          Text("T-Shirt",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      )),
                  Container(
                      height: 200,
                      width: 150,
                      color: Colors.black12,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            'images/category/woman.jpg',
                            height: 150,
                            width: 90,
                          ),
                          Text("Women T-Shirt",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      )),
                ],
              )),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 5),
            child: Text(
              "New Products",
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: (_product.length > 0)
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 3,
                    ),
                    physics:
                        NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                    shrinkWrap: true,
                    itemCount: _product.length,
                    itemBuilder: (context, index) {
                      String img = _product[index]['img'];
                      return Container(
                        color: Colors.lightGreenAccent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SilverScreen(
                                        _product[index]['name'],
                                        _product[index]['img'])));
                          },
                          child: Column(
                            children: [
                              Image.asset('$img', height: 100, width: 70),
                              Text(
                                _product[index]['name'],
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              //Text(_product[index]['Price'],style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      );
                    })
                : Text("Loading ... Please Wait !!"),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              "Latest Products",
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
            height: 140,
            margin: EdgeInsets.only(top: 5),
            child: _product.length > 0
                ? ListView.builder(
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: _product.length,
                    itemBuilder: (context, int index) {
                      String img = _product[index]['img'];
                      return Container(
                          padding: EdgeInsets.all(5),
                          color: Colors.lightGreenAccent,
                          height: 140,
                          width: 300,
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                '$img',
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_product[index]['name']),
                                  Text(_product[index]['Price']),
                                  Text(_product[index]['RAM'] +
                                      " + " +
                                      _product[index]['ROM']),
                                ],
                              )
                            ],
                          ));
                    },
                  )
                : Text("Please Wait!!  Loading..."),
          )
        ],
      ),
    );
  }
}

class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return About_State();
  }
}

class About_State extends State<About> {
  List _products = [];
  Future<void> fetch_pro() async {
    final String jsondata = await rootBundle.loadString("api/product.json");
    final data = await json.decode(jsondata);
    setState(() {
      _products = data['Product'];
    });
  }

  @override
  Widget build(BuildContext context) {
    fetch_pro();
    return Scaffold(
        appBar: AppBar(
          title: Text("Products Page", style: TextStyle(fontFamily: 'fontr')),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          //primary:false,
          child: Column(
            children: [
              _products.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        String img = _products[index]['img'];
                        return Container(
                          padding: EdgeInsets.all(5),
                          child: Card(
                              elevation: 7,
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    "$img",
                                    height: 160,
                                    width: 90,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(_products[index]['name']),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.4,
                                        child: Text(
                                            _products[index]['description']),
                                      ),
                                      Text(_products[index]['Price']),
                                      RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        onPressed: () {},
                                        child: Text("View"),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        );
                      })
                  : CircularProgressIndicator(),
            ],
          ),
        ));
  }
}

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Search_State();
  }
}

class Search_State extends State<Search> {
  TextEditingController searchcontroller = TextEditingController();
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter value here !!";
              }
              return null;
            },
            controller: searchcontroller,
            cursorColor: Colors.white,
            obscureText: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Search",
              hintText: "Search Something ...",
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              suffixIcon: Icon(
                Icons.youtube_searched_for_rounded,
                color: Colors.white,
              ),
            ),
            onChanged: (val) {
              setState(() {
                search = val;
              });
            },
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(child: Text("Search value is :" + searchcontroller.text)),
    );
  }
}

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Settings_State();
  }
}

class Settings_State extends State<Settings> {
  List _products = [];
  Future<void> fetchproduct() async {
    final String response = await rootBundle.loadString("api/product.json");
    final data = await json.decode(response);
    setState(() {
      _products = data['Product'];
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchproduct();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Setting  Page",
              style: TextStyle(fontStyle: FontStyle.italic)),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
          height: 200,
          child: _products.length > 0
              ? ListView.builder(
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.horizontal,
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    String img = _products[index]['img'];
                    return Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        height: 150,
                        width: 300,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "$img",
                                height: 170,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_products[index]['name']),
                                  Text(_products[index]['Price']),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SilverScreen(
                                                        _products[index]
                                                            ['name'],
                                                        _products[index]
                                                            ['img'])));
                                      },
                                      child: Text(
                                        "View",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              )
                            ]));
                  })
              : Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.lightGreen,
                  child: ListView.builder(
                      padding: EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10)),
                            height: 150,
                            width: 300,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.image, size: 50),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Loading Data. .."),
                                      Text(
                                        "Please Wait ...",
                                      ),
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            " ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))
                                    ],
                                  )
                                ]));
                      }))),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Profile_State();
  }
}

class Profile_State extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Profile")),
      body: ListView(scrollDirection: Axis.vertical,
          //shrinkWrap: false,
          children: [
            Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              color: Colors.lightGreenAccent,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset(
                    "images/customer/customer.jpg",
                    fit: BoxFit.fill,
                  ),
                  Text(
                    "Zeel Chauhan",
                    style: TextStyle(fontFamily: "fontr", fontSize: 20),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}

class SilverScreen extends StatefulWidget {
  String pname = '';
  String pimg = '';
  SilverScreen(String Var, String img) {
    pname = Var;
    pimg = img;
  }
  @override
  State<StatefulWidget> createState() {
    return SilverScreen_State(pname, pimg);
  }
}

class SilverScreen_State extends State<SilverScreen> {
  List _products = [];
  //fetch details of product from API
  Future<void> fetchproduct() async {
    final String response = await rootBundle.loadString("api/product.json");
    final data = await json.decode(response);
    setState(() {
      _products = data["Product"][0];
    });
  }

  String pname = '';
  String pimg = '';

  SilverScreen_State(String Var, String img) {
    pname = Var;
    pimg = img;
  }
  @override
  Widget build(BuildContext context) {
    fetchproduct();
    return Scaffold(
      backgroundColor: Colors.black12,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            primary: false,
            floating: true,
            elevation: 10,
            snap: true,
            backwardsCompatibility: false,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            shadowColor: Colors.lightGreenAccent,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  "$pname (11999 Rs)",
                  style: TextStyle(color: Colors.black),
                ),
                collapseMode: CollapseMode.parallax,
                background: Container(
                  //color:Colors.yellow,
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        CarouselSlider(
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              autoPlay: false,
                            ),
                            items: [
                              Image.asset(
                                '$pimg',
                                height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitHeight,
                              ),
                              Image.asset(
                                'images/img/redmi9A2.jpg',
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitHeight,
                              ),
                              Image.asset(
                                'images/img/redmi9A3.jpg',
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitHeight,
                              ),
                              Image.asset(
                                'images/img/redmi9A4.jpg',
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitHeight,
                              ),
                              Image.asset(
                                'images/img/redmi9A5.jpg',
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitHeight,
                              ),
                            ])
                      ]),
                )),
          ),
          SliverFillRemaining(
              child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                  margin: EdgeInsets.all(5),
                  height: 50,
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$pname",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.green, fontSize: 25),
                        ),
                        Text(
                          " (11999 Rs)",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red, fontSize: 25),
                        ),
                      ])),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                  width: 25,
                  color: Colors.white,
                  child: ExpansionTile(
                    title: Text("Similar Products"),
                    children: <Widget>[
                      ListTile(
                          title: Row(children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          color: Colors.black12,
                          width: MediaQuery.of(context).size.width / 2.8,
                          child: Column(
                            children: [
                              Image.asset(
                                'images/img/iphone9.jpg',
                                height: MediaQuery.of(context).size.height / 4,
                              ),
                              Text("I Phone 9")
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          color: Colors.black12,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset(
                                'images/img/oneplus.jpg',
                                height: MediaQuery.of(context).size.height / 4,
                              ),
                              Text("One Plus")
                            ],
                          ),
                          width: MediaQuery.of(context).size.width / 2.8,
                        )
                      ]))
                    ],
                  )),
              // _products.forEach((key,val) {
              //   print('$key --> $val');
              // }),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: ListView(
                    shrinkWrap: false,
                    children: [
                      ListTile(
                        leading: Icon(Icons.storage),
                        title: Text("RAM : 8GB + 128GB"),
                      ),
                      ListTile(
                        leading: Icon(Icons.camera),
                        title: Text(
                          "CAMERA(BACK/FRONT) : 48MP ( AI ) +12MP",
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.battery_full_outlined),
                        title: Text(
                          "BATTERY : 5000 mAh Li-Poly Battery ",
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.description),
                        title: Text(
                          "DESCRIPTION : $pname is very Slim and nice mobile phone and 48 Mega pixel camera with AI Which is Todays higher Technology across india .and also 5000 mAh Polymial Battery ",
                        ),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.only(left: 25, right: 20),
                        height: 45,
                        width: MediaQuery.of(context).size.width / 2.5,
                        color: Colors.orangeAccent,
                        child: InkWell(
                          splashColor: Colors.green,
                          onTap: () {
                            print("buy now");
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Row(
                            children: [
                              Icon(Icons.shopping_cart),
                              Text("Buy Now")
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        padding: EdgeInsets.only(left: 25, right: 20),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 45,
                        color: Colors.amberAccent,
                        child: InkWell(
                          splashColor: Colors.green,
                          onTap: () {
                            print("AddCart");
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Row(
                            children: [
                              Icon(Icons.shopping_cart),
                              Text("Add To Cart"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ))
        ],
      ),
    );
  }
}

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List _products = [];
  //fetch details of product from API
  Future<void> fetchproduct() async {
    final String response = await rootBundle.loadString("api/product.json");
    final data = await json.decode(response);
    setState(() {
      _products = data["Product"];
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchproduct();
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Page"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _products.length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: _products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          leading: Text(_products[index]['RAM']),
                          title: Text(_products[index]['name']),
                          trailing: Text(_products[index]['Price']),
                          subtitle: Text(_products[index]['description']),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(_products[index]['name']),
                            ));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Shop_Product(),
                                    settings: RouteSettings(arguments: {
                                      "name": _products[index]['name'],
                                      "img": _products[index]['img']
                                    })));
                          },
                        ),
                      );
                    })
                : CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}

class Shop_Product extends StatelessWidget {
  Map myMap = {};
  @override
  Widget build(BuildContext context) {
    myMap = ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    //final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, int>;
    return Scaffold(
      appBar:
          AppBar(title: Text("Product name "), backgroundColor: Colors.green),
      body: Column(
        children: [
          Image.asset(myMap['img']),
          Text(myMap['name']),
        ],
      ),
    );
  }
}

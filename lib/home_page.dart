import 'package:flutter/material.dart';
import 'package:project/bottom_nav_pages.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePage_State();
  }
}

class HomePage_State extends State<HomePage> {
  var _page = [Home(), Search(), About(), Settings(), Profile()];
  int _SelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _page[_SelectedIndex],
      ),
      bottomNavigationBar: ConvexAppBar(
        //type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.deepPurple,
        activeColor: Colors.white,
        style: TabStyle.reactCircle,
        //selectedItemColor: Colors.red,
        //showUnselectedLabels: true,
        //unselectedItemColor: Colors.black,
        items: [
          TabItem(
            icon: Icon(
              Icons.home,
              color: Colors.red,
            ),
            title: "Home",
          ),
          TabItem(
            icon: Icon(
              Icons.search,
              color: Colors.deepOrange,
            ),
            title: "Search",
          ),
          TabItem(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            title: "Products",
          ),
          TabItem(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.blue,
            ),
            title: "Cart",
          ),
          TabItem(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Colors.cyanAccent,
            ),
            title: "Profile",
          )
        ],
        onTap: (setval) {
          setState(() {
            _SelectedIndex = setval;
          });
        },
      ),
    );
  }
}

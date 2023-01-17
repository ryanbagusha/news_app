import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/home/home-page.dart';
import 'package:news/profile/profile-page.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  List pages = [HomePage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Text("News",
                style: TextStyle(
                  color: Color(0xff00579c),
                  fontWeight: FontWeight.w900,
                )),
            Text(
              "Update",
              style: TextStyle(
                  color: Color(0xffc4942e),
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  fontFamily: 'Open Sans'),
            ),
            Text(
              ".co.id",
              style: TextStyle(
                color: Color(0xffc4942e),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

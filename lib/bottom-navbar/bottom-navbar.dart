import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/main-page/relasi/relasi-page.dart';
import 'package:news/main-page/home/home-page.dart';
import 'package:news/main-page/regional/regional-page.dart';
import 'package:news/main-page/profile/profile-page.dart';
import 'package:news/route/main-routing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavbar extends StatefulWidget {
  final bool login;

  const BottomNavbar({Key? key, required this.login}) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  List pages = [];
  List<BottomNavigationBarItem> items = [];

  @override
  void initState() {
    super.initState();

    if (widget.login) {
      pages = [HomePage(), RegionalPage(), RelasiPage(), ProfilePage()];
      items = [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on), label: 'Regional'),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Relasi'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
      ];
    } else {
      pages = [HomePage(), RegionalPage(), RelasiPage()];
      items = [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on), label: 'Regional'),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Relasi')
      ];
    }
  }

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
        actions: <Widget>[
          TextButton(
              onPressed: () {
                if (!widget.login) {
                  Navigator.pushNamed(context, '/login');
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Logout'),
                          content: Text('Apakah anda yakin ingin logout?'),
                          icon: Icon(Icons.warning),
                          iconColor: Colors.yellow,
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.remove('login');
                                  prefs.remove('nama');
                                  prefs.remove('email');
                                  prefs.remove('username');
                                  prefs.remove('id_role');
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainRouting(login: false)),
                                  );
                                },
                                child: Text('Ok')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Batal'))
                          ],
                        );
                      });
                }
              },
              child: (!widget.login) ? Icon(Icons.person) : Icon(Icons.logout))
        ],
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
        items: items,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

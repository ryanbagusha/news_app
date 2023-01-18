import 'package:flutter/material.dart';
import 'package:news/bottom_navbar/bottom_navbar.dart';
import 'package:news/login/login_page.dart';
import 'package:news/profile/profile-page.dart';

import '../home/home-page.dart';

class MainRouting extends StatelessWidget {
  const MainRouting({super.key});

  @override
  Widget build(Object context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home",
      initialRoute: '/bottom_navbar',
      routes: {
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/login': (context) => LoginPage(),
        '/bottom_navbar': (context) => BottomNavbar(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

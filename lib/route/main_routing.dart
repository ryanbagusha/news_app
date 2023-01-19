import 'package:flutter/material.dart';
import 'package:news/bottom_navbar/bottom_navbar.dart';
import 'package:news/login/login_page.dart';
import 'package:news/main_page/profile/profile-page.dart';

import '../main_page/home/home-page.dart';

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
        '/login': (context) => LoginPage(),
        '/bottom_navbar': (context) => BottomNavbar(),
      },
      theme: ThemeData(
        fontFamily: "Montserrat",
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

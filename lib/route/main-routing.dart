import 'package:flutter/material.dart';
import 'package:news/bottom-navbar/bottom-navbar.dart';
import 'package:news/crud/berita/list-berita.dart';
import 'package:news/crud/galeri/list-galeri.dart';
import 'package:news/crud/kategori/list-kategori.dart';
import 'package:news/crud/komentar/list-komentar.dart';
import 'package:news/crud/peristiwa/list-peristiwa.dart';
import 'package:news/crud/role/list-role.dart';
import 'package:news/crud/tag/list-tag.dart';
import 'package:news/crud/user/list-user.dart';
import 'package:news/login/login-page.dart';
import 'package:news/main-page/profile/profile-page.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';

import '../main-page/home/home-page.dart';

class MainRouting extends StatelessWidget {
  final bool login;

  const MainRouting({Key? key, required this.login}) : super(key: key);

  @override
  Widget build(Object context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home",
      initialRoute: '/bottom_navbar',
      routes: {
        '/login': (context) => LoginPage(),
        '/bottom_navbar': (context) => BottomNavbar(login: login),
        '/list-berita': (context) => ListBeritaPage(),
        '/list-peristiwa': (context) => ListPeristiwaPage(),
        '/list-galeri': (context) => ListGaleriPage(),
        '/list-kategori': (context) => ListKategoriPage(),
        '/list-tag': (context) => ListTagPage(),
        '/list-role': (context) => ListRolePage(),
        '/list-user': (context) => ListUserPage(),
        '/list-komentar': (context) => ListKomentarPage(),
      },
      theme: ThemeData(
        fontFamily: "Montserrat",
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

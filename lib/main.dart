import 'package:flutter/material.dart';
import 'package:news/route/main-routing.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var login = prefs.getBool('login') ?? false;
  // print(login);
  runApp(MainRouting(login: login,));
}

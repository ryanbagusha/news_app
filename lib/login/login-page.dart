import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/bottom-navbar/bottom-navbar.dart';
import 'package:news/config/const.dart';
import 'package:news/route/main-routing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

  bool visible = false;

  @override
  void initState() {
    super.initState();
  }

  _cekLogin() async {
    setState(() {
      visible = true;
    });
    final prefs = await SharedPreferences.getInstance();
    var params = "auth/login.php?username=" +
        txtUsername.text +
        "&password=" +
        txtPassword.text;

    try {
      var res = await http.get(Uri.parse(url + params));
      if (res.statusCode == 200) {
        var response = json.decode(res.body);
        if (response['response_status'] == "OK") {
          // print(response);
          // print(response['data'][0]['nama']);
          var data = response['data'][0];
          prefs.setBool('login', true);
          prefs.setString('nama', data['nama']);
          prefs.setString('email', data['email']);
          prefs.setString('username', data['username']);
          prefs.setString('id_role', data['id_role']);
          setState(() {
            visible = false;
          });

          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     '/bottom_navbar', (Route<dynamic> route) => false);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const MainRouting(login: true)),
          );
        } else {
          setState(() {
            visible = false;
          });

          _showAlertDialog(context, response['response_message']);
        }
      }
    } catch (e) {
      _showAlertDialog(context, e.toString());
    }
  }

  _showAlertDialog(BuildContext context, String err) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login'),
            content: Text(err),
            icon: Icon(Icons.dangerous_rounded),
            iconColor: Colors.red,
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Text("News",
                      style: TextStyle(
                        color: Color(0xff00579c),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      )),
                  Text(
                    "Update",
                    style: TextStyle(
                        color: Color(0xffc4942e),
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        fontFamily: 'Open Sans'),
                  ),
                  Text(
                    ".co.id",
                    style: TextStyle(
                      color: Color(0xffc4942e),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.blueGrey)),
              child: TextFormField(
                controller: txtUsername,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Masukkan Username',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(Icons.person),
                    border: InputBorder.none),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.blueGrey)),
              child: TextFormField(
                controller: txtPassword,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Masukkan Password',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(Icons.key),
                    border: InputBorder.none),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              // padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                onPressed: () {
                  _cekLogin();
                },
                child: Text('Masuk'),
              ),
            ),
            Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: visible,
                child: Container(child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}

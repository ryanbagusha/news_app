import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  FocusNode focusNode = new FocusNode();

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
                onPressed: () {},
                child: Text('Masuk'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                border: Border.all(color: Colors.blue, width: 1),
              ),
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.person,
                  size: 56,
                  color: Colors.blue,
                ),
              ),
            ),
            Text('Silakan Login Terlebih Dahulu'),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text('Login')),
            )
          ],
        ),
      ),
    );
  }
}

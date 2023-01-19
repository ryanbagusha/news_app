import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 2),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Color(0xffc4942e),
                  width: 2, // Underline thickness
                ))),
                child: Text(
                  'Hot Topik',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    child: Image.network(
                      "https://i2.wp.com/blog.tripcetera.com/id/wp-content/uploads/2020/10/Danau-Toba-edited.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Ini Adalah Judul Berita Judul Berita Di HomePage Ada Disini ygy wkwk",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timer,
                        size: 11,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "20 Desember 2022",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(bottom: 2),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Color(0xff00579c),
                  width: 2, // Underline thickness
                ))),
                child: Text(
                  'News',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    child: Image.network(
                      "https://i2.wp.com/blog.tripcetera.com/id/wp-content/uploads/2020/10/Danau-Toba-edited.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Ini Adalah Judul Berita Judul Berita Di HomePage Ada Disini ygy wkwk",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timer,
                        size: 11,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "20 Desember 2022",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    child: Image.network(
                      "https://i2.wp.com/blog.tripcetera.com/id/wp-content/uploads/2020/10/Danau-Toba-edited.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Ini Adalah Judul Berita Judul Berita Di HomePage Ada Disini ygy wkwk",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timer,
                        size: 11,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "20 Desember 2022",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    child: Image.network(
                      "https://i2.wp.com/blog.tripcetera.com/id/wp-content/uploads/2020/10/Danau-Toba-edited.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Ini Adalah Judul Berita Judul Berita Di HomePage Ada Disini ygy wkwk",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timer,
                        size: 11,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "20 Desember 2022",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

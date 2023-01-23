import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/main-page/home/section/galeri.dart';
import 'package:news/main-page/home/section/home.dart';
import 'package:news/main-page/home/section/internasional.dart';
import 'package:news/main-page/home/section/nasional.dart';
import 'package:news/main-page/home/section/peristiwa.dart';
import 'package:news/main-page/relasi/relasi-page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<String> sections = [
    "Home",
    "Galeri",
    "Peristiwa",
    "Nasional",
    "Internasional"
  ];

    PageController _controller = PageController(
    initialPage: 0,
  );
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xff00579c)
        ),
        child: Column(
          children: [
            Container(
              height: 35,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  return Container(
                    // padding: EdgeInsets.symmetric(
                    //   vertical: 10,
                    // ),
                    margin: EdgeInsets.only(top: 10),
                    child: TextButton(
                      onPressed: () {
                        _controller.animateToPage(i,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        sections[i],
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: currentPage == i
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: sections.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: [
                  HomeSection(),
                  GaleriSection(),
                  PeristiwaSection(),
                  NasionalSection(),
                  InternasionalSection()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

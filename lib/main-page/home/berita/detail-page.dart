import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/config/const.dart';
import 'package:news/model/berita/berita-model.dart';

class Detail extends StatelessWidget {
  final BeritaModel berita;

  const Detail({Key? key, required this.berita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Color(0xff00579c),
                  expandedHeight: 300.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      width: MediaQuery.of(context).size.width,
                      height: double.infinity,
                      child: Image.asset(
                        imageUrl + berita.media,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ];
            },
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                padding: EdgeInsets.all(20),
                child: ListView(children: [
                  Text(
                    berita.judul,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    berita.tanggal,
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    berita.isi,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ]))));
  }
}

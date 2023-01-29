import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/config/const.dart';
import 'package:news/main-page/home/berita/detail-page.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:news/model/service.dart';

class HomeSection extends StatefulWidget {
  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  Service service = Service();
  late Future<List<BeritaModel>> listBerita;
  late Future<List<BeritaModel>> hotnews;

  @override
  void initState() {
    super.initState();
    listBerita = service.getBerita(1);
    hotnews = service.getHotNews();
  }

  @override
  Widget build(BuildContext context) {
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
              FutureBuilder<List<BeritaModel>>(
                future: hotnews,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<BeritaModel> data = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => Detail(
                                    berita: data[index],
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    // imageUrl + data[index].media,
                                    imageUrl + data[index].media,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    data[index].judul,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
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
                                      data[index].tanggal,
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('Data Kosong'),
                    );
                  }
                },
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
              FutureBuilder<List<BeritaModel>>(
                future: listBerita,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<BeritaModel> data = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => Detail(
                                    berita: data[index],
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    // imageUrl + data[index].media,
                                    imageUrl + data[index].media,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    data[index].judul,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
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
                                      data[index].tanggal,
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('Data Kosong'),
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}

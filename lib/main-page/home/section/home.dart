import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/config/const.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:news/model/service.dart';

class HomeSection extends StatefulWidget {
  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  Service service = Service();
  late Future<List<BeritaModel>> listBerita;

  @override
  void initState() {
    super.initState();
    listBerita = service.getBerita(1);
    // print(listData);
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/config/const.dart';
import 'package:news/main-page/home/berita/detail-page.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:news/model/service.dart';

class RelasiPage extends StatefulWidget {
  @override
  State<RelasiPage> createState() => _RelasiPageState();
}

class _RelasiPageState extends State<RelasiPage> {
  Service service = Service();
  late Future<List<BeritaModel>> listBerita;

  @override
  void initState() {
    super.initState();
    listBerita = service.getBerita(3);
    // print(listData);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: FutureBuilder<List<BeritaModel>>(
        future: listBerita,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BeritaModel> data = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
    );
  }
}

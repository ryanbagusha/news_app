import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/config/const.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:news/model/service.dart';

class PeristiwaSection extends StatefulWidget {
  @override
  State<PeristiwaSection> createState() => _PeristiwaSectionState();
}

class _PeristiwaSectionState extends State<PeristiwaSection> {
  Service service = Service();
  late Future<List<BeritaModel>> listBerita;

  @override
  void initState() {
    super.initState();
    listBerita = service.getBerita(2);
    // print(listData);
  }

  @override
  Widget build(BuildContext context) {
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
                            data[index].tanggal,
                            style: TextStyle(fontSize: 11, color: Colors.grey),
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
    );
  }
}

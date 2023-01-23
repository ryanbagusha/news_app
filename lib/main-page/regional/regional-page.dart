import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/service.dart';

class RegionalPage extends StatefulWidget {
  @override
  State<RegionalPage> createState() => _RegionalPageState();
}

class _RegionalPageState extends State<RegionalPage> {
  Service service = Service();
  late Future<List<KategoriModel>> listData;

  @override
  void initState() {
    super.initState();
    listData = service.getKategoriData();
    // print(listData);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: FutureBuilder<List<KategoriModel>>(
        future: listData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<KategoriModel> data = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 10, primary: Color(0xff00579c)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailKategoriPage(id_kategori: data[index].id, nama_kategori: data[index].nama,)),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(data[index].nama),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news/config/const.dart';
import 'package:news/crud/berita/add-berita.dart';
import 'package:news/crud/role/add-role.dart';
import 'package:news/crud/role/edit-role.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/role/laporan-model.dart';
import 'package:news/model/role/role-model.dart';
import 'package:news/model/service.dart';
import 'package:news/model/tag/tag-model.dart';
import 'package:http/http.dart' as http;

class ListLaporanPage extends StatefulWidget {
  @override
  State<ListLaporanPage> createState() => _ListLaporanPageState();
}

class _ListLaporanPageState extends State<ListLaporanPage> {
  Service service = Service();
  late Future<List<LaporanModel>> list;

  @override
  void initState() {
    super.initState();
    list = service.getLaporan();
    // print(listData);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00579c),
        title: Text("List Role"),
      ),
      body: FutureBuilder<List<LaporanModel>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<LaporanModel> data = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(data[index].nama,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        'Jumlah Post : ' + data[index].jumlah_post,
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      Text(
                        'Total Honor : Rp. ' + data[index].total_harga,
                        style: TextStyle(fontSize: 11, color: Colors.grey),
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

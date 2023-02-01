import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news/config/const.dart';
import 'package:news/crud/berita/add-berita.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/service.dart';

class ListGaleriPage extends StatefulWidget {
  @override
  State<ListGaleriPage> createState() => _ListGaleriPageState();
}

class _ListGaleriPageState extends State<ListGaleriPage> {
  Service service = Service();
  late Future<List<BeritaModel>> list;

  @override
  void initState() {
    super.initState();
    list = service.getBerita(3);
    // print(listData);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00579c),
        title: Text("List Galeri"),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "add data berita",
        onPressed: () {
          // Navigator.of(context).pushReplacement(new MaterialPageRoute(
          //     builder: (BuildContext context) => new AddBeritaPage()));
        },
        backgroundColor: Color(0xff00579c),
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<BeritaModel>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BeritaModel> data = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Color(0xff00579c),
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(data[index].judul,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          data[index].tanggal,
                          style: TextStyle(fontSize: 11, color: Colors.grey),
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

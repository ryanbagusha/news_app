import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news/config/const.dart';
import 'package:news/crud/berita/add-berita.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/service.dart';
import 'package:http/http.dart' as http;

class ListKategoriPage extends StatefulWidget {
  @override
  State<ListKategoriPage> createState() => _ListKategoriPageState();
}

class _ListKategoriPageState extends State<ListKategoriPage> {
  Service service = Service();
  late Future<List<KategoriModel>> list;

  void deleteData(id) async {
    var params = "kategori/delete_kategori.php";
    await http.post(Uri.parse(url + params), body: {'id': id});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return ListKategoriPage();
    }));
    _deleteData(context, "Data berhasil dihapus");
  }

  void _deleteData(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    list = service.getKategoriData();
    // print(listData);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00579c),
        title: Text("List Kategori"),
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
      body: FutureBuilder<List<KategoriModel>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<KategoriModel> data = snapshot.data!;
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
                        onPressed: (context) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Hapus'),
                                  content: Text(
                                      'Apakah anda yakin ingin menghapus ' +
                                          data[index].nama +
                                          '?'),
                                  icon: Icon(Icons.warning),
                                  iconColor: Colors.red,
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          deleteData(data[index].id);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Ok')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Batal'))
                                  ],
                                );
                              });
                        },
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
                          child: Text(data[index].nama,
                              style: TextStyle(fontWeight: FontWeight.bold)),
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

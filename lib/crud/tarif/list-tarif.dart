import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news/config/const.dart';
import 'package:news/crud/berita/add-berita.dart';
import 'package:news/crud/role/add-role.dart';
import 'package:news/crud/role/edit-role.dart';
import 'package:news/crud/tarif/edit-tarif.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/role/role-model.dart';
import 'package:news/model/service.dart';
import 'package:news/model/tag/tag-model.dart';
import 'package:http/http.dart' as http;

class ListTarifPage extends StatefulWidget {
  @override
  State<ListTarifPage> createState() => _ListTarifPageState();
}

class _ListTarifPageState extends State<ListTarifPage> {
  Service service = Service();
  late Future<List<RoleModel>> list;

  void deleteData(id) async {
    var params = "role/delete_role.php";
    await http.post(Uri.parse(url + params), body: {'id': id});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return ListTarifPage();
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
    list = service.getRole();
    // print(listData);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00579c),
        title: Text("List Tarif"),
      ),
      body: FutureBuilder<List<RoleModel>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<RoleModel> data = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => EditTarifPage(
                                role: data[index],
                              ),
                            ),
                          );
                        },
                        backgroundColor: Color(0xff00579c),
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
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
                        ),
                        Text(
                          'Rp.' + data[index].harga,
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

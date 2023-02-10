import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:news/config/const.dart';
import 'package:news/crud/komentar/list-komentar.dart';
import 'package:news/crud/user/list-user.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:news/model/role/role-model.dart';
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/service.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/user/user-model.dart';

class AddKomentarPage extends StatefulWidget {
  @override
  State<AddKomentarPage> createState() => _AddKomentarPageState();
}

class _AddKomentarPageState extends State<AddKomentarPage> {
  Service service = Service();
  late Future<List<BeritaModel>> berita;
  late Future<List<UserModel>> user;

  TextEditingController txtNama = TextEditingController();
  TextEditingController txtKomentar = TextEditingController();

  String? selectedBerita = null;
  String? selectedUser = null;

  void addData() async {
    var params = "komentar/add_komentar.php";

    http.post(Uri.parse(url + params), body: {
      "nama": txtNama.text,
      "komentar": txtKomentar.text,
      "berita": selectedBerita,
      "user": selectedUser,
    });
  }

  void error(BuildContext context, String error) {
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
    berita = service.getBerita(1);
    user = service.getUser();
    // print(role);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00579C),
        title: Text("Tambah Komentar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextFormField(
                  controller: txtNama,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty value";
                    }
                  },
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintText: "Nama", labelText: "Nama"),
                ),
                TextFormField(
                  controller: txtKomentar,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty value";
                    }
                  },
                  style: TextStyle(fontSize: 15),
                  decoration:
                      InputDecoration(hintText: "Isi", labelText: "Isi"),
                  maxLines: null,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                ),
                FutureBuilder<List<BeritaModel>>(
                  future: berita,
                  builder: (context, snapshot) {
                    return DropdownButton<String>(
                      hint: Text("Pilih Berita"),
                      value: selectedBerita,
                      items: snapshot.data
                          ?.map((fc) => DropdownMenuItem<String>(
                                child: Text(fc.judul),
                                value: fc.id,
                              ))
                          .toList(),
                      onChanged: (Object? value) {
                        setState(() {
                          selectedBerita = value.toString();
                        });
                      },
                      isExpanded: true,
                      style:
                          TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                FutureBuilder<List<UserModel>>(
                  future: user,
                  builder: (context, snapshot) {
                    return DropdownButton<String>(
                      hint: Text("Pilih User"),
                      value: selectedUser,
                      items: snapshot.data
                          ?.map((fc) => DropdownMenuItem<String>(
                                child: Text(fc.nama),
                                value: fc.id,
                              ))
                          .toList(),
                      onChanged: (Object? value) {
                        setState(() {
                          selectedUser = value.toString();
                        });
                      },
                      isExpanded: true,
                      style:
                          TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            addData();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return ListKomentarPage();
                            }));
                          },
                          child: Text(
                            "Tambah Data",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff00579c))),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:news/config/const.dart';
import 'package:news/crud/berita/list-berita.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/service.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/tag/tag-model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBeritaPage extends StatefulWidget {
  @override
  State<AddBeritaPage> createState() => _AddBeritaPageState();
}

class _AddBeritaPageState extends State<AddBeritaPage> {
  Service service = Service();
  late Future<List<TagModel>> tag;
  late Future<List<KategoriModel>> kategori;

  TextEditingController txtJudul = TextEditingController();
  TextEditingController txtTanggal = TextEditingController();
  TextEditingController txtIsi = TextEditingController();
  // TextEditingController imageMedia = TextEditingController();

  String? selectedKategori = null;
  String? selectedTag = null;

  String? user = null;
  String? type = '1';

  void addData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user = prefs.getString('id') ?? '';
    });

    var params = "berita/add_berita.php";

    http.post(Uri.parse(url + params), body: {
      "judul": txtJudul.text,
      "tanggal": txtTanggal.text,
      "isi": txtIsi.text,
      "media": '-',
      "total_view": '0',
      "kategori": selectedKategori,
      "tag": selectedTag,
      "type": type,
      "user": user,
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
    tag = service.getTag();
    kategori = service.getKategoriData();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00579c),
        title: Text("Tambah Berita"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextFormField(
                  controller: txtJudul,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty value";
                    }
                  },
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintText: "Judul Berita", labelText: "Judul Berita"),
                ),
                TextFormField(
                  controller: txtTanggal,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty value";
                    }
                  },
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintText: "Tanggal", labelText: "Tanggal"),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030));
                    if (pickDate != null) {
                      String formattedDate =
                          DateFormat("yyyy-MM-dd").format(pickDate);
                      setState(() {
                        txtTanggal.text = formattedDate.toString();
                      });
                    } else {
                      print('not selected');
                    }
                  },
                ),
                TextFormField(
                  controller: txtIsi,
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
                FutureBuilder<List<TagModel>>(
                  future: tag,
                  builder: (context, snapshot) {
                    return DropdownButton<String>(
                      hint: Text("Pilih Tag"),
                      value: selectedTag,
                      items: snapshot.data
                          ?.map((fc) => DropdownMenuItem<String>(
                                child: Text(fc.nama),
                                value: fc.id,
                              ))
                          .toList(),
                      onChanged: (Object? value) {
                        setState(() {
                          selectedTag = value.toString();
                        });
                      },
                      isExpanded: true,
                      style:
                          TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
                    );
                  },
                ),
                FutureBuilder<List<KategoriModel>>(
                  future: kategori,
                  builder: (context, snapshot) {
                    return DropdownButton<String>(
                      hint: Text("Pilih Kategori"),
                      value: selectedKategori,
                      items: snapshot.data
                          ?.map((fc) => DropdownMenuItem<String>(
                                child: Text(fc.nama),
                                value: fc.id,
                              ))
                          .toList(),
                      onChanged: (Object? value) {
                        setState(() {
                          selectedKategori = value.toString();
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
                          onPressed: () {
                            addData();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ListBeritaPage()));
                          },
                          child: Text(
                            "Tambah",
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

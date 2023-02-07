import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:news/config/const.dart';
import 'package:news/crud/tag/list-tag.dart';
import 'package:news/model/service.dart';
import 'package:http/http.dart' as http;

class AddTagPage extends StatefulWidget {
  @override
  State<AddTagPage> createState() => _AdTagPageState();
}

class _AdTagPageState extends State<AddTagPage> {
  TextEditingController txtNama = TextEditingController();
  TextEditingController txtDeskripsi = TextEditingController();

  void addData() async {
    var params = "tag/add_tag.php";

    http.post(Uri.parse(url + params), body: {
      "nama": txtNama.text,
      "deskripsi": txtDeskripsi.text,
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
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00579C),
        title: Text("Tambah Tag"),
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
                      hintText: "Nama Tag", labelText: "Nama Tag"),
                ),
                TextFormField(
                  controller: txtDeskripsi,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintText: "Deskripsi", 
                      labelText: "Deskripsi"),
                  maxLines: null,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
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
                              return ListTagPage();
                            }));
                          },
                          child: Text(
                            "Tambah Data",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff00579c))),
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

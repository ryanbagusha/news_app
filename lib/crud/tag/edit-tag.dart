import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:news/config/const.dart';
import 'package:news/crud/tag/list-tag.dart';
import 'package:news/model/tag/tag-model.dart';
import 'package:news/model/service.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/tag/tag-model.dart';

class EditTagPage extends StatefulWidget {
  final TagModel tag;

  const EditTagPage({Key? key, required this.tag}) : super(key: key);

  @override
  State<EditTagPage> createState() => EditTagPageState();
}

class EditTagPageState extends State<EditTagPage> {
  TextEditingController txtNama = TextEditingController();
  TextEditingController txtDeskripsi = TextEditingController();

  void editData() async {
    var params = "tag/edit_tag.php";

    http.post(Uri.parse(url + params), body: {
      "id": widget.tag.id,
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
  void initState() {
    txtNama = new TextEditingController(text: widget.tag.nama);
    txtDeskripsi = new TextEditingController(text: widget.tag.deskripsi);
    // txtNama = widget.role.rnama.toString() as TextEditingController;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00579C),
        title: Text("Edit Tag"),
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
                      hintText: "Deskripsi", labelText: "Deskripsi"),
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
                            editData();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return ListTagPage();
                            }));
                          },
                          child: Text(
                            "Edit Data",
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

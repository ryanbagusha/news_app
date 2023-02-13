import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:news/config/const.dart';
import 'package:news/crud/role/list-role.dart';
import 'package:news/crud/tarif/list-tarif.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';
import 'package:news/model/role/role-model.dart';
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/service.dart';
import 'package:http/http.dart' as http;

class EditTarifPage extends StatefulWidget {
  final RoleModel role;

  const EditTarifPage({Key? key, required this.role}) : super(key: key);

  @override
  State<EditTarifPage> createState() => EditTarifPageState();
}

class EditTarifPageState extends State<EditTarifPage> {
  TextEditingController txtHarga = TextEditingController();

  void editData() async {
    var params = "role/edit_tarif.php";

    http.post(Uri.parse(url + params), body: {
      "id": widget.role.id,
      "harga": txtHarga.text,
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
    txtHarga = new TextEditingController(text: widget.role.harga);
    // txtHarga = widget.role.rnama.toString() as TextEditingController;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00579C),
        title: Text("Edit Tarif"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextFormField(
                  controller: txtHarga,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty value";
                    }
                  },
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintText: "Harga", labelText: "Harga"),
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
                              return ListTarifPage();
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:news/config/const.dart';
import 'package:news/crud/role/list-role.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';
import 'package:news/model/role/role-model.dart';
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/service.dart';
import 'package:http/http.dart' as http;

class EditRolePage extends StatefulWidget {
  final RoleModel role;

  const EditRolePage({Key? key, required this.role}) : super(key: key);

  @override
  State<EditRolePage> createState() => EditRolePageState();
}

class EditRolePageState extends State<EditRolePage> {
  TextEditingController txtNama = TextEditingController();

  void editData() async {
    var params = "role/edit_role.php";

    http.post(Uri.parse(url + params), body: {
      "id": widget.role.id,
      "nama": txtNama.text,
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
    txtNama = new TextEditingController(text: widget.role.nama);
    // txtNama = widget.role.rnama.toString() as TextEditingController;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00579C),
        title: Text("Edit Role"),
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
                      hintText: "Nama Role", labelText: "Nama Role"),
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
                              return ListRolePage();
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

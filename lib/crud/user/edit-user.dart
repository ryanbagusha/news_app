import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:news/config/const.dart';
import 'package:news/crud/user/list-user.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';
import 'package:news/model/role/role-model.dart';
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/service.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/user/user-model.dart';

class EditUserPage extends StatefulWidget {
  final UserModel user;

  const EditUserPage({Key? key, required this.user}) : super(key: key);
  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  Service service = Service();
  late Future<List<RoleModel>> role;

  TextEditingController txtNama = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController? txtPassword = TextEditingController();

  String? selectedRole = null;

  void addData() async {
    var params = "user/edit_user.php";

    http.post(Uri.parse(url + params), body: {
      "id": widget.user.id,
      "nama": txtNama.text,
      "email": txtEmail.text,
      "username": txtUsername.text,
      "password": txtPassword?.text,
      "role": selectedRole,
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
    role = service.getRole();

    txtNama = new TextEditingController(text: widget.user.nama);
    txtEmail = new TextEditingController(text: widget.user.email);
    txtUsername = new TextEditingController(text: widget.user.username);
    selectedRole = widget.user.idRole.toString();

    // print(role);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00579C),
        title: Text("Edit User"),
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
                      hintText: "Nama User", labelText: "Nama User"),
                ),
                TextFormField(
                  controller: txtEmail,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty value";
                    }
                  },
                  style: TextStyle(fontSize: 15),
                  decoration:
                      InputDecoration(hintText: "Email", labelText: "Email"),
                ),
                TextFormField(
                  controller: txtUsername,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty value";
                    }
                  },
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintText: "Username", labelText: "Username"),
                ),
                TextFormField(
                  controller: txtPassword,
                  obscureText: true,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintText: "Kosongkan password jika tidak berubah", labelText: "Password"),
                ),
                FutureBuilder<List<RoleModel>>(
                  future: role,
                  builder: (context, snapshot) {
                    return DropdownButton<String>(
                      hint: Text("Pilih Role"),
                      value: selectedRole,
                      items: snapshot.data
                          ?.map((fc) => DropdownMenuItem<String>(
                                child: Text(fc.nama),
                                value: fc.id,
                              ))
                          .toList(),
                      onChanged: (Object? value) {
                        setState(() {
                          selectedRole = value.toString();
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
                              return ListUserPage();
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

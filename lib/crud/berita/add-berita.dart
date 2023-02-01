import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:news/config/const.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/service.dart';

class AddBeritaPage extends StatefulWidget {
  @override
  State<AddBeritaPage> createState() => _AddBeritaPageState();
}

class _AddBeritaPageState extends State<AddBeritaPage> {
  TextEditingController txtJudul = TextEditingController();
  TextEditingController txtTanggal = TextEditingController();
  TextEditingController txtIsi = TextEditingController();
  TextEditingController imageMedia = TextEditingController();
  TextEditingController selectKategori = TextEditingController();
  TextEditingController selectTag = TextEditingController();

  // void addData() {
  //   var url = "http://10.0.2.2/my_store/adddata.php";

  //   http.post(url, body: {
  //     "itemcode": txtJudul.text,
  //     "itemname": txtTanggal.text,
  //     "price": txtIsi.text,
  //     "stock": imageMedia.text
  //   });
  // }

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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    minLines:
                        6, // any number you need (It works as the rows for the textarea)
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: txtIsi,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Empty value";
                      }
                    },
                    style: TextStyle(fontSize: 15),
                    decoration:
                        InputDecoration.collapsed(hintText: "Isi Berita"),
                  ),
                ),
                // TextFormField(
                //   controller: imageMedia,
                //   style: TextStyle(fontSize: 15),
                //   decoration:
                //       InputDecoration(hintText: "Stock", labelText: "Stock"),
                // ),
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
                            if (txtJudul.value.text.isEmpty) {
                              setState(() {
                                error(context, "ID tidak boleh kosong");
                              }); //ID gabole kosong
                            } else if (txtJudul.value.text
                                .contains(RegExp(r'[a-zA-Z]'))) {
                              setState(() {
                                error(context, "ID harus angka");
                                error(context, "Isi data dengan benar!");
                              }); //id harus angka
                            } else if (txtJudul.value.text.length != 3) {
                              setState(() {
                                error(context, "ID harus berisi 3 angka");
                                error(context, "Isi data dengan benar!");
                              }); //id harus 3 angka
                            } else if (txtTanggal.value.text.isEmpty) {
                              setState(() {
                                error(context, "Nama item tidak boleh kosong");
                                error(context, "Isi data dengan benar!");
                              }); //nama ga bole kosong
                            } else if (txtTanggal.value.text.length < 5) {
                              error(context,
                                  "Nama item minimal harus 5 karakter");
                              error(context, "Isi data dengan benar!");
                              //nama gaboleh kurang dari 5
                            } else if (txtIsi.value.text.isEmpty) {
                              setState(() {
                                error(context, "Harga tidak boleh kosong");
                                error(context, "Isi data dengan benar!");
                              }); //harga gabole kosong
                            } else if (txtIsi.value.text
                                .contains(RegExp(r'[a-zA-Z]'))) {
                              setState(() {
                                error(context, "Isi hanya dengan angka");
                                error(context, "Isi data dengan benar!");
                              }); //harga harus angka
                            } else if (txtIsi.value.text.length < 4) {
                              setState(() {
                                error(context, "Harga tidak sesuai format");
                                error(context, "Isi data dengan benar!");
                              }); //harga harus minimal 4 karakter
                            } else {
                              // addData();
                              // Navigator.pushReplacement(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return Home();
                              // }));
                            }

                            // Navigator.of(context).pushReplacement(MaterialPageRoute(
                            //     builder: (BuildContext context) => Home()));
                          },
                          child: Text(
                            "Add Data",
                            style: TextStyle(color: Colors.white),
                          )),
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

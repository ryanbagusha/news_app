import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/main-page/regional/detail-kategori-page.dart';
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/service.dart';

class ListBeritaPage extends StatefulWidget {
  @override
  State<ListBeritaPage> createState() => _ListBeritaPageState();
}

class _ListBeritaPageState extends State<ListBeritaPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00579c),
      ),
    );
  }
}

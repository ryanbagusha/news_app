import 'dart:convert';

import 'package:news/config/const.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/kategori/kategori-model.dart';

class Service {
  Future<List<BeritaModel>> getBerita(int type) async {
    const params = 'berita/get_berita.php?id_type=';

    final response = await http.get(Uri.parse(url + params + type.toString()));
    // print(url + params + type.toString());

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => BeritaModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  Future<List<KategoriModel>> getKategoriData() async {
    const params = 'kategori/get_all_kategori.php';

    final response = await http.get(Uri.parse(url + params));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => KategoriModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }

    Future<List<BeritaModel>> getBeritaKategori(int kategori) async {
    const params = 'berita/get_berita_kategori.php?id_kategori=';

    final response = await http.get(Uri.parse(url + params + kategori.toString()));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => BeritaModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }
}

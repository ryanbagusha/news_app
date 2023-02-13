import 'dart:convert';

import 'package:news/config/const.dart';
import 'package:news/model/berita/berita-model.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/kategori/kategori-model.dart';
import 'package:news/model/komentar/komentar-model.dart';
import 'package:news/model/role/laporan-model.dart';
import 'package:news/model/role/role-model.dart';
import 'package:news/model/tag/tag-model.dart';
import 'package:news/model/user/user-model.dart';

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

    final response =
        await http.get(Uri.parse(url + params + kategori.toString()));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => BeritaModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  Future<List<BeritaModel>> getHotNews() async {
    const params = 'berita/get_hotnews.php';

    final response = await http.get(Uri.parse(url + params));
    // print(url + params + type.toString());

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => BeritaModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  Future<List<TagModel>> getTag() async {
    const params = 'tag/get_all_tag.php';

    final response = await http.get(Uri.parse(url + params));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => TagModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }
  
  Future<List<RoleModel>> getRole() async {
    const params = 'role/get_all_role.php';

    final response = await http.get(Uri.parse(url + params));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => RoleModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  Future<List<UserModel>> getUser() async {
    const params = 'user/get_all_user.php';

    final response = await http.get(Uri.parse(url + params));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => UserModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  Future<List<KomentarModel>> getKomentar() async {
    const params = 'komentar/get_all_komentar.php';

    final response = await http.get(Uri.parse(url + params));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => KomentarModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }

    Future<List<LaporanModel>> getLaporan() async {
    const params = 'role/get_laporan.php';

    final response = await http.get(Uri.parse(url + params));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => LaporanModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }
}

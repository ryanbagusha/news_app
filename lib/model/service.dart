import 'dart:convert';

import 'package:news/config/api.dart';
import 'package:news/model/berita-model.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<BeritaModel>> getPostData() async {
    const params = 'berita/get_all_post.php';

    final response = await http.get(Uri.parse(url + params));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => BeritaModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }
}

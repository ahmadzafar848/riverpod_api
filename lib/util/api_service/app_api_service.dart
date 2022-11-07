import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_api/models/AlbumModel.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String _albumApiEndUrl = '/albums';
  Future<List<AlbumModel>> fetchAlbum() async {
    Response response = await get(Uri.parse(_baseUrl + _albumApiEndUrl));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => AlbumModel.fromMap(e)).toList();
    }
    return [];
  }
}

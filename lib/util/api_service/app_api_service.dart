import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:riverpod_api/models/AlbumModel.dart';
import 'package:riverpod_api/models/LoginModel.dart';
import 'package:riverpod_api/models/SignUpModel.dart';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String _albumApiEndUrl = '/albums';

  static const String _foodAppBaseUrl = 'https://food.elms.pk/api/FoodDelivery';
  static const String _foodAppLoginUrl = '/PublicCheckLogin';

  Future<List<AlbumModel>> fetchAlbum() async {
    Response response = await get(Uri.parse(_baseUrl + _albumApiEndUrl));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => AlbumModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<Map<String, dynamic>> loginThroughForm(LoginModel model) async {
    Response response = await post(
      Uri.parse(_foodAppBaseUrl + _foodAppLoginUrl),
      body: jsonEncode({'email': model.email, 'password': model.password}),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Access-Control-Allow-Origin": "*"
      },
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<Map<String, dynamic>> signUpThroughForm(SignUpModel model) async {
    Response response = await post(Uri.parse(''),
        body: jsonEncode(
          {
            'Email': model.email,
            'Password': model.password,
            'DisplayName': model.displayName,
            'LoginBy': model.loginBy
          },
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          "Access-Control-Allow-Origin": "*"
        });
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}

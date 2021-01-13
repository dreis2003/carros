import 'dart:convert';

import 'package:carros/model/usuario.dart';
import 'package:carros/model/api_response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse> login(String login, String senha) async {
    var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Map params = {
      "username": login,
      "password": senha,
    };

    String s = json.encode(params);

    var response = await http.post(url, body: s, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      final user = Usuario.fromJson(mapResponse);
      return ApiResponse.ok(user);
    }

    return ApiResponse.error(mapResponse["error"]);
  }
}
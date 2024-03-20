import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthDataProvider {
  Future<String> login(String username, String password) async {
    try {
      final Uri url =
          Uri.https('klassrum.onrender.com', 'api/auth/teachers/login');
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "username": username,
            "password": password,
          }));

      if (response.statusCode != 200) {
        throw response.body;
      }
      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> fetchTeacherData(String id, String token) async {
    try {
      final Uri url = Uri.https('klassrum.onrender.com', 'api/teachers/$id');
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode != 200) {
        throw response.body;
      }
      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }
}

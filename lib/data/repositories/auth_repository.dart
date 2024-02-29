import 'dart:convert';

import 'package:klassrum_web/data/dataproviders/auth_provider.dart';
import 'package:klassrum_web/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;
  const AuthRepository(this.authDataProvider);

  Future<UserModel> _getUserById(String userId) async {
    // try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jwt = prefs.get('token').toString();
    print(jwt);
    final String response =
        await authDataProvider.fetchTeacherData(userId, jwt);
    print(response);
    final data = jsonDecode(response);

    return UserModel.fromMap(data[0]);
    // } catch (e) {
    //   throw e.toString();
    // }
  }

  Future<UserModel> getAppUser(String username, String password) async {
    try {
      final String response = await authDataProvider.login(username, password);
      final data = jsonDecode(response);
      print(data);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data['token']);
      return _getUserById(data['userId']);
    } catch (e) {
      throw e.toString();
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class ScheduleDataProvider {
  Future<String> fetchScheduleData(String token) async {
    try {
      final Uri url = Uri.https('klassrum.onrender.com', 'api/sessions');
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

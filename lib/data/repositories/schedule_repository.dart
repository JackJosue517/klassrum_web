import 'dart:convert';
import 'package:klassrum_web/data/dataproviders/schedule_provider.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleRepository {
  final ScheduleDataProvider scheduleDataProvider;

  const ScheduleRepository(this.scheduleDataProvider);

  Future<List<ShedulerCourse>> getSchedule() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final jwt = prefs.get('token').toString();
      final String response = await scheduleDataProvider.fetchScheduleData(jwt);
      final List<dynamic> data = jsonDecode(response);
      return data.map((item) => ShedulerCourse.fromJson(item)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}

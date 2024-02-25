import 'package:klassrum_web/data/data_source/shedule_course_data_source.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';

class SheduleCourseDataProvider {
  static List<ShedulerCourse> getSheduledCourses() {
    final listSheduledCourse =
        tableData.map((e) => ShedulerCourse.fromJson(e)).toList();
    return listSheduledCourse;
  }
}

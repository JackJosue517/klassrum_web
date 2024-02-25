import 'package:klassrum_web/data/dataproviders/shedule_course_data_provider.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';

List<ShedulerCourse> getData(String selectOption) {
  List<ShedulerCourse> shedulerCourses =
      SheduleCourseDataProvider.getSheduledCourses();
  switch (selectOption) {
    case "A venir":
      return shedulerCourses
          .where((element) => element.status == "after")
          .toList();

    case "Passé":
      return shedulerCourses
          .where((element) => element.status == "before")
          .toList();

    case "Annulé":
      return shedulerCourses
          .where((element) => element.status == "cancel")
          .toList();
    default:
      return shedulerCourses;
  }
}

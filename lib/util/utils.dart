import 'package:flutter/material.dart';
import 'package:klassrum_web/data/dataproviders/shedule_course_data_provider.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';
import 'package:klassrum_web/ui/styles/color.dart';

List<ShedulerCourse> getData(String selectOption) {
  List<ShedulerCourse> shedulerCourses =
      SheduleCourseDataProvider.getSheduledCourses();
  switch (selectOption) {
    case "A venir":
      return shedulerCourses
          .where((element) => element.status == "A venir")
          .toList();

    case "Passé":
      return shedulerCourses
          .where((element) => element.status == "Terminé")
          .toList();

    case "Annulé":
      return shedulerCourses
          .where((element) => element.status == "Annulé")
          .toList();
    default:
      return shedulerCourses;
  }
}

Widget tableHeader(String header) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        //color: AppColors.statistiqueCommingCardColor,
      ),
      child: Text(
        header,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.statistiqueCardTextColor),
        //textAlign: TextAlign.center,
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';
import 'package:klassrum_web/ui/pages/reprogram_page.dart';
import 'package:klassrum_web/ui/pages/view_more.dart';
import 'package:klassrum_web/ui/styles/color.dart';
import 'package:klassrum_web/util/utils.dart';

class CoursProgram extends StatefulWidget {
  const CoursProgram({super.key, required this.sheduledCourses});
  final List<ShedulerCourse> sheduledCourses;
  @override
  State<CoursProgram> createState() => _MyTableState();
}

class _MyTableState extends State<CoursProgram> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: [
          DataColumn(label: tableHeader("Code")),
          DataColumn(label: tableHeader("Intitulé")),
          DataColumn(label: tableHeader("Chapitre")),
          DataColumn(label: tableHeader("Enseignant")),
          DataColumn(label: tableHeader("Date")),
          DataColumn(label: tableHeader("Statut")),
          DataColumn(label: tableHeader("Action")),
        ],
        rows: widget.sheduledCourses
            .map((sheduledCourse) => DataRow(cells: [
                  DataCell(Text(sheduledCourse.code)),
                  DataCell(Text(sheduledCourse.intitule)),
                  DataCell(Text(sheduledCourse.chapitre)),
                  DataCell(Text(sheduledCourse.enseignant)),
                  DataCell(Text(sheduledCourse.date)),
                  DataCell(Text(sheduledCourse.status)),
                  DataCell((sheduledCourse.status) != "before"
                      ? getActionButton(sheduledCourse.status, sheduledCourse)
                      : const Center(
                          child: Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                        ))
                ]))
            .toList(),
      ),
    );
  }

  Color _getButtonColor(String statut) {
    // Add your condition here to determine the color based on the state
    if (statut == "after") {
      return AppColors.editbuttonColor;
    } else if (statut == "during") {
      return AppColors.duringButtonColor; // Change this to your desired color
    } else if (statut == "cancel") {
      return AppColors.cancelButtonColor; // Change this to your desired color
    } else {
      return Colors.black; // Change this to your default color
    }
  }

  String _getText(String statut) {
    // Add your condition here to determine the color based on the state
    if (statut == "after") {
      return "Voir plus";
    } else if (statut == "during") {
      return "Voir plus"; // Change this to your desired color
    } else if (statut == "cancel") {
      return "Reprogrammer"; // Change this to your desired color
    } else {
      return "T'es sur ?"; // Change this to your default color
    }
  }

  Widget getActionButton(String statut, ShedulerCourse sheduledCourse) {
    return Center(
      child: SizedBox(
        width: 150,
        child: FilledButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(_getButtonColor(statut)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: getRespectiveDialogPage(statut, sheduledCourse),
                );
              },
            );
          },
          child: Text(_getText(statut)),
        ),
      ),
    );
  }

  Widget getRespectiveDialogPage(String statut, ShedulerCourse sheduledCourse) {
    switch (statut) {
      case "cancel":
        return ReprogramPage(sheduledCourse: sheduledCourse);
      default:
        return ViewMorePage(sheduledCourse: sheduledCourse);
    }
  }
}

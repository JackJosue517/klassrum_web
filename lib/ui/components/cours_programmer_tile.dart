import 'package:flutter/material.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';
import 'package:klassrum_web/ui/pages/during_view_more.dart';
import 'package:klassrum_web/ui/pages/reprogram_page.dart';
import 'package:klassrum_web/ui/pages/terminated_view_more.dart';
import 'package:klassrum_web/ui/pages/upcomming_view_more.dart';
import 'package:klassrum_web/ui/styles/color.dart';
import 'package:klassrum_web/util/table_model.dart';

class CoursProgram extends StatefulWidget {
  const CoursProgram({super.key, required this.sheduledCourses});
  final List<ShedulerCourse> sheduledCourses;
  @override
  State<CoursProgram> createState() => _MyTableState();
}

final columns = [
  "Code",
  "Intitule",
  "Chapitre",
  "Enseignant",
  "Date",
  "Status",
  "Action"
];

class _MyTableState extends State<CoursProgram> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Table(
            // border: TableBorder.all(color: Colors.grey),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                  children:
                      columns.map((e) => TableHeaderTile(text: e)).toList()),
              ...widget.sheduledCourses.map(
                (e) => TableRow(
                  children: [
                    TableTile(text: e.code),
                    TableTile(text: e.intitule),
                    TableTile(text: e.chapitre),
                    TableTile(text: e.enseignant),
                    TableTile(text: e.date),
                    statutForm(e.status),
                    actionText(e.status, e)
                  ],
                ),
              )
            ]));
  }

  Widget statutForm(String statut) {
    Color couleur;
    switch (statut) {
      case "A venir": // Upcoming
        couleur = Colors.teal; // Adjusted for better accessibility
      case "En cours": // In progress
        couleur = Colors.orange;
      case "Annulé": // Canceled
        couleur = Colors.red;
      case "Terminé": // Past
        couleur = Colors.grey; // Adjusted for better accessibility
      default:
        couleur = Colors.black; // Default color
    }
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: Color(0xFFEDEDED)),
        child: Text(
          textAlign: TextAlign.center,
          statut,
          style: TextStyle(
            color: couleur,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget actionText(String statut, ShedulerCourse sheduledCourse) {
    String text = "Voir plus";
    if (statut == "Annulé") {
      text = "Reprogrammer";
    }
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: AppColors.buttonColors),
          child: InkWell(
            child: Text(
              textAlign: TextAlign.center,
              text,
              style: const TextStyle(
                color: AppColors.buttonTextColors,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: getRespectiveDialogPage(statut, sheduledCourse),
                  );
                },
              );
            },
          )),
    );
  }

  Widget getRespectiveDialogPage(String statut, ShedulerCourse sheduledCourse) {
    switch (statut) {
      case "Annulé":
        return ReprogramPage(sc: sheduledCourse);
      case "Terminé":
        return TerminatedViewMorePage(sc: sheduledCourse);
      case "En cours":
        return DuringViewMorePage(sc: sheduledCourse);
      default:
        return UpCommigViewMorePage(sc: sheduledCourse);
    }
  }
}

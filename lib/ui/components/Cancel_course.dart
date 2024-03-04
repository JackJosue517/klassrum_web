import 'package:flutter/material.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';
import 'package:klassrum_web/ui/pages/reprogram_page.dart';
import 'package:klassrum_web/ui/styles/color.dart';
import 'package:klassrum_web/util/table_model.dart';

class CancelCourse extends StatefulWidget {
  const CancelCourse({super.key, required this.sheduledCourses});
  final List<ShedulerCourse> sheduledCourses;
  @override
  State<CancelCourse> createState() => _MyTableState();
}

class _MyTableState extends State<CancelCourse> {
  final columns = [
    "Code",
    "Intitule",
    "Chapitre",
    "Enseignant",
    "Date",
    "Action"
  ];

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
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              color: AppColors.buttonColors),
                          child: InkWell(
                            child: const Text(
                              textAlign: TextAlign.center,
                              "Reprogrammer",
                              style: TextStyle(
                                color: AppColors.buttonTextColors,
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                      child: ReprogramPage(sc: e));
                                },
                              );
                            },
                          )),
                    )
                  ],
                ),
              )
            ]));
  }
}

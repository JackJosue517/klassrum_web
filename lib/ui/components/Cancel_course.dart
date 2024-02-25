import 'package:flutter/material.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';
import 'package:klassrum_web/ui/pages/reprogram_page.dart';
import 'package:klassrum_web/ui/styles/color.dart';

class CancelCourse extends StatefulWidget {
  const CancelCourse({super.key, required this.sheduledCourses});
  final List<ShedulerCourse> sheduledCourses;
  @override
  State<CancelCourse> createState() => _MyTableState();
}

class _MyTableState extends State<CancelCourse> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: const [
          DataColumn(label: Text("Code")),
          DataColumn(label: Text("Intitulé")),
          DataColumn(label: Text("Chapitre")),
          DataColumn(label: Text("Enseignant")),
          DataColumn(label: Text("Date")),
          DataColumn(label: Text("Action")),
        ],
        rows: widget.sheduledCourses
            .map((sheduledCourse) => DataRow(cells: [
                  DataCell(Text(sheduledCourse.code)),
                  DataCell(Text(sheduledCourse.intitule)),
                  DataCell(Text(sheduledCourse.chapitre)),
                  DataCell(Text(sheduledCourse.enseignant)),
                  DataCell(Text(sheduledCourse.date)),
                  DataCell(Center(
                    child: SizedBox(
                      width: 150,
                      child: FilledButton(
                        style: ButtonStyle(
                          backgroundColor:
                             const MaterialStatePropertyAll(AppColors.cancelButtonColor),
                          shape:
                              MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: ReprogramPage(sheduledCourse: sheduledCourse),
                              );
                            },
                          );
                        },
                        child: const Text("Reprogrammer"),
                      ),
                    ),
                  ))
                ]))
            .toList(),
      ),
    );
  }
}

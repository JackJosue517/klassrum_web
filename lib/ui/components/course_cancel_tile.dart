import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/styles/color.dart';

void main() {
  runApp(const CancelCourseTile());
}

class CancelCourseTile extends StatelessWidget {
  const CancelCourseTile({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyTable(),
    );
  }
}

class MyTable extends StatefulWidget {
  const MyTable({super.key});
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  List<Map<String, String>> tableData = [
    {
      "Code": "001",
      "Intitulé": "Flutter",
      "Chapitre": "Widgets",
      "Nbre Etudiants": "25",
      "Heure": "10:00 AM",
      "Etat": "En cours",
      "Date": "10/16/2006"
    },
    {
      "Code": "001",
      "Intitulé": "Flutter",
      "Chapitre": "Widgets",
      "Nbre Etudiants": "25",
      "Heure": "10:00 AM",
      "Etat": "En cours",
      "Actions": "Modifier",
      "Date": "10/06/2010"
    },
    // Ajoutez d'autres données au besoin
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tableData.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTableCell(tableData[index]["Code"]!),
                buildTableCell(tableData[index]["Intitulé"]!),
                buildTableCell(tableData[index]["Chapitre"]!),
                buildTableCell(tableData[index]["Date"]!),
                FilledButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          AppColors.buttonColors),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          );
                        });
                  },
                  child: const Text("Reprogrammer"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTableCell(String text) {
    return TableCell(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

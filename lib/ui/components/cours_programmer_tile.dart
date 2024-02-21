import 'package:flutter/material.dart';

void main() {
  runApp(const CoursProgrammerTile());
}

class CoursProgrammerTile extends StatelessWidget {
  const CoursProgrammerTile({super.key});
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
      "Actions": "Modifier",
    },
    {
      "Code": "001",
      "Intitulé": "Flutter",
      "Chapitre": "Widgets",
      "Nbre Etudiants": "25",
      "Heure": "10:00 AM",
      "Etat": "En cours",
      "Actions": "Modifier",
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
                buildTableCell(tableData[index]["Nbre Etudiants"]!),
                buildTableCell(tableData[index]["Heure"]!),
                buildTableCell(tableData[index]["Etat"]!),
                FilledButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.green),
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
                  child: const Text("Voir plus"),
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

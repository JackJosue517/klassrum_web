import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/ui/pages/view_more.dart';
import 'package:klassrum_web/ui/styles/color.dart';

void main() {
  runApp(const CoursProgram());
}

class CoursProgram extends StatelessWidget {
  const CoursProgram({super.key});
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
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  List<Map<String, String>> tableData = [
    {
      "Code": "001",
      "Intitulé": "Flutter",
      "Chapitre": "Widgets",
      "Nbre Etudiants": "25",
      "Heure": "10:00 AM",
      "Etat": "during",
      "Date": "10/16/2006",
      "responsable": "Mr ANANI",
    },
    {
      "Code": "002",
      "Intitulé": "les concepts de base ",
      "Chapitre": "les concepts de base ",
      "Nbre Etudiants": "20",
      "Heure": "2:00 PM",
      "Etat": "cancel",
      "responsable": "Mr Doc",
      "Date": "10/20/2022"
    },
    {
      "Code": "001",
      "Intitulé": "Flutter",
      "Chapitre": "Widgets",
      "Nbre Etudiants": "25",
      "Heure": "10:00 AM",
      "Etat": "before",
      "Date": "10/16/2006",
      "responsable": "Mr ANANI",
    },
    {
      "Code": "001",
      "Intitulé": "Flutter",
      "Chapitre": "Widgets",
      "Nbre Etudiants": "25",
      "Heure": "10:00 AM",
      "Etat": "pass",
      "Date": "10/16/2006",
      "responsable": "Mr ANANI",
    },
    // Ajoutez d'autres données au besoin
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tableData.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(2.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //le tete de la table
                if (index == 0)
                  buildTableHead([
                    "Code",
                    "Intitulé",
                    "Chapitre",
                    "date",
                    "Responsable",
                    "statut",
                    "Action"
                  ]),
                const Gap(4),
                //le corps du tableau
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: buildTableCell(tableData[index]["Code"]!)),
                    const Gap(8),
                    Expanded(
                        child: buildTableCell(tableData[index]["Intitulé"]!)),
                    const Gap(8),
                    Expanded(
                        child: buildTableCell(tableData[index]["Chapitre"]!)),
                    const Gap(8),
                    Expanded(child: buildTableCell(tableData[index]["Date"]!)),
                    const Gap(8),
                    Expanded(
                        child:
                            buildTableCell(tableData[index]["responsable"]!)),
                    const Gap(8),
                    Expanded(child: buildTableCell(tableData[index]["Etat"]!)),
                    const Gap(8),
                    (tableData[index]["Etat"]!) != "pass"
                        ? FilledButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  _getButtonColor(tableData[index]["Etat"]!)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const Dialog(
                                    child: ViewMorePage(),
                                  );
                                },
                              );
                            },
                            child: Text(_getText(tableData[index]["Etat"]!)),
                          )
                        : const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ) // Use Container() or any other widget for the else case
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

//constructeur des données
  Widget buildTableCell(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.start,
    );
  }

//l'entete du tableau
  Widget buildTableHead(List<String> headers) {
    //print(headers);
    return Container(
      decoration: const BoxDecoration(color: Colors.blueGrey),
      child: Row(
        children: headers.map((header) {
          return Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                header,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color to white
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _getButtonColor(String statut) {
    // Add your condition here to determine the color based on the state
    if (statut == "before") {
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
    if (statut == "before") {
      return "Voir plus";
    } else if (statut == "during") {
      return "Voir plus"; // Change this to your desired color
    } else if (statut == "cancel") {
      return "Reprogrammer"; // Change this to your desired color
    } else {
      return "T'es sur ?"; // Change this to your default color
    }
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';
import 'package:klassrum_web/ui/components/app_button.dart';
import 'package:klassrum_web/ui/styles/color.dart';

class UpCommigViewMorePage extends StatefulWidget {
  const UpCommigViewMorePage({super.key, required this.sc});
  final ShedulerCourse sc;
  @override
  State<UpCommigViewMorePage> createState() => _UpCommigViewMorePageState();
}

class _UpCommigViewMorePageState extends State<UpCommigViewMorePage> {
  void ontapondelete() {
    _showDeleteConfirmationDialog(context);
  }

  _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Êtes-vous sûr de vouloir annuler cette séance?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Annuler la suppression
                Navigator.of(context).pop();
              },
              child: const Text('Non'),
            ),
            TextButton(
              onPressed: () {
                // Confirmer la suppression
                _onDeleteConfirmed();
              },
              child: const Text('Oui'),
            ),
          ],
        );
      },
    );
  }

  void _onDeleteConfirmed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 400,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white, // Ajouter une couleur de fond
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // Changement de l'ombre
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/course_banner.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  right: 16, left: 16, top: 32, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.sc.intitule,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.buttonColors,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(),
                  const Gap(8),
                  Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // En-tête
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "Cours: ",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  widget.sc.code,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Professeur: ",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  widget.sc.enseignant,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(12),

                        // Informations principales
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                widget.sc.chapitre,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const Gap(32),
                            Column(
                              children: [
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Text(
                                          "Statut: ",
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          widget.sc.status,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: AppColors
                                                  .upCommingStatutColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    const Text(
                                      "Date: ",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      widget.sc.date,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(10),

                        // Heures du cours
                        Card(
                          color: AppColors.buttonColors,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    const Text(
                                      "Heure de début",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.buttonTextColors),
                                    ),
                                    Text(
                                      widget.sc.heureDebut,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.buttonTextColors),
                                    ),
                                  ],
                                ),
                                const Gap(10),
                                Column(
                                  children: <Widget>[
                                    const Text(
                                      "Heure de fin",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.buttonTextColors),
                                    ),
                                    Text(
                                      widget.sc.heureFin,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColors.buttonTextColors),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(10),
                        // Description du cours
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Description :",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Gap(8),
                            Expanded(
                              child: Text(
                                widget.sc.description,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                          text: "Modifier",
                          couleur: AppColors.buttonColors,
                          onTapActions: () => {null}),
                      const Gap(12),
                      AppButton(
                          text: "Annuler",
                          couleur: AppColors.deleteButtonColor,
                          onTapActions: ontapondelete)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

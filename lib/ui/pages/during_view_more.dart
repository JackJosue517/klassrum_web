import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';
import 'package:klassrum_web/ui/components/app_button.dart';
import 'package:klassrum_web/ui/components/unchangeable_checkbox.dart';
import 'package:klassrum_web/ui/styles/color.dart';
import 'package:klassrum_web/ui/screens/call_room.dart';

class DuringViewMorePage extends StatefulWidget {
  const DuringViewMorePage({super.key, required this.sc});
  final ShedulerCourse sc;
  @override
  State<DuringViewMorePage> createState() => _DuringViewMorePageState();
}

class _DuringViewMorePageState extends State<DuringViewMorePage> {
  
  void ontaponMeet() {
    Navigator.of(context).pushNamed("/call-room",
        arguments: CallArguments('uid', 'jackzo', 'Jack517'));
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
                    style: const TextStyle(
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
                                const Text(
                                  "Cours: ",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  widget.sc.code,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Professeur: ",
                                  style: TextStyle(fontSize: 16),
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
                                        const Text(
                                          "Statut: ",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          widget.sc.status,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color:
                                                  AppColors.duringstatutColor,
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
                                          fontWeight: FontWeight.bold,
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
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.buttonTextColors),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(10),
                        Center(
                          child: Wrap(
                            children: [
                              UnchangeableCheckBox(
                                  speciality: "speciality 1", isChecked: true),
                              UnchangeableCheckBox(
                                  speciality: "speciality 2", isChecked: true),
                              UnchangeableCheckBox(
                                  speciality: "speciality 3", isChecked: false)
                            ],
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
                            const Gap(8),
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
                          text: "Aller en salle",
                          couleur: AppColors.duringstatutColor,
                          onTapActions: () => ontaponMeet()),
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

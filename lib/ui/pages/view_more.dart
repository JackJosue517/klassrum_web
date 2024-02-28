import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';
import 'package:klassrum_web/ui/components/app_button.dart';
import 'package:klassrum_web/ui/styles/color.dart';

class ViewMorePage extends StatefulWidget {
  const ViewMorePage({super.key, required this.sheduledCourse});
  final ShedulerCourse sheduledCourse;
  @override
  State<ViewMorePage> createState() => _ViewMorePageState();
}

class _ViewMorePageState extends State<ViewMorePage> {
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
      width: 600,
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
                  const Text(
                    "Programmation distribuée (INF432)",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(),
                  const Gap(24),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Les services REST",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/img/default_profil.jpg"),
                                ),
                                SizedBox(width: 4),
                                Text("Nom du prof"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("Heure de début"),
                                SizedBox(height: 4),
                                Text("1H30min"),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Heure de fin"),
                                SizedBox(height: 4),
                                Text("6H30min"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.buttonColors),
                                color: Colors.transparent,
                              ),
                              child: const Text("Dans 1h"),
                            ),
                          ],
                        ),
                      ],
                    ),
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

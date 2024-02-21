import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/ui/components/cours_programmer_tile.dart';
import 'package:klassrum_web/ui/styles/color.dart';

class CoursPage extends StatefulWidget {
  const CoursPage({super.key});

  @override
  State<CoursPage> createState() => _CoursPageState();
}

class _CoursPageState extends State<CoursPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Gap(30),
          Align(
            alignment: Alignment.topRight,
            child: FilledButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(AppColors.buttonColors),
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
                    },
                  );
                },
                child: const Text(
                  "Programmer un cours",
                  style: TextStyle(
                    color: AppColors.buttonTextColors,
                  ),
                )),
          ),
          const Gap(24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Code",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Intitulé",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Chapitre",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Nbre Etudiants",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Heure",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Etat",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Actions",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Gap(24),
          Column(
              children:
                  List.generate(3, (index) => const CoursProgrammerTile())),
          const Gap(24)
        ],
      ),
    );
  }
}

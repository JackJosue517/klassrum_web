import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';
import 'package:klassrum_web/ui/styles/color.dart';

class ViewMorePage extends StatefulWidget {
  const ViewMorePage({super.key, required this.sheduledCourse});
  final ShedulerCourse sheduledCourse;
  @override
  State<ViewMorePage> createState() => _ViewMorePageState();
}

class _ViewMorePageState extends State<ViewMorePage> {
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
                            backgroundImage:  AssetImage(
                              "assets/img/default_profil.jpg",
                            ),
                          ),
                           Gap(4),
                           Text("Nom du prof"),
                        ],
                      ),
                    ],
                  ),
                  const Gap(24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("Heure de début"),
                           Gap(4),
                          Text("1H30min"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Heure de fin"),
                           Gap(4),
                          Text("6H30min"),
                        ],
                      ),
                    ],
                  ),
                  const Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.buttonColors),
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: const Text("Dans 1h"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 150,
            decoration: const BoxDecoration(
              borderRadius:  BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              image:  DecorationImage(
                image: AssetImage("assets/img/course_banner.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

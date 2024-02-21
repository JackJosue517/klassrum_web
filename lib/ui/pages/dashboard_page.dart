import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/ui/components/nearest_course.dart';
import 'package:klassrum_web/ui/components/statistique_card.dart';
import 'package:klassrum_web/ui/styles/color.dart';
import 'package:klassrum_web/ui/components/navigation_drawer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        drawer: const CustomNavigationDrawer(),
        body: Center(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              color: AppColors.dashboardBackgroundColors,
              child: Column(children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatistiqueCard(
                        couleur: AppColors.statistiqueCommingCardColor,
                        icon: "assets/img/online-learning.png",
                        titre: "Cours programmés",
                        valeur: 5),
                    StatistiqueCard(
                        couleur: AppColors.statistiqueAlreadyCardColor,
                        icon: "assets/img/online-learning.png",
                        titre: "Cours programmés",
                        valeur: 5),
                    StatistiqueCard(
                        couleur: AppColors.statistiqueCancelCardColor,
                        icon: "assets/img/online-learning.png",
                        titre: "Cours annulés",
                        valeur: 5),
                  ],
                ),
                const Gap(20),
                Expanded(
                  child: Row(
                    children: [
                      const NearestCourse(),
                      const Gap(32),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 1, 51, 4),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Column(children: [
                            /*Row(children: [
                          Text("Notion"),
                          Text("Date"),
                          Text("Prof"),
                        Text("duree"),
                        Text("Nonbre etidiant"),
                        ],)*/
                          ]),
                        ),
                      ),
                    ],
                  ),
                )
              ])),
        ));
  }
}

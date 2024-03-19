import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/ui/components/cancel_course.dart';
import 'package:klassrum_web/ui/components/nearest_course.dart';
import 'package:klassrum_web/ui/components/statistique_card.dart';
import 'package:klassrum_web/ui/styles/color.dart';
import 'package:klassrum_web/ui/components/navigation_drawer.dart';
import 'package:klassrum_web/util/utils.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatistiqueCard(
                        couleur: AppColors.statistiqueCommingCardColor,
                        icon: "assets/img/online-learning.png",
                        titre: "Cours programmés",
                        valeur: (getData("Tout")).length),
                    StatistiqueCard(
                        couleur: AppColors.statistiqueAlreadyCardColor,
                        icon: "assets/img/online-learning.png",
                        titre: "Cours faits",
                        valeur: (getData("Terminé")).length),
                    StatistiqueCard(
                        couleur: AppColors.statistiqueCancelCardColor,
                        icon: "assets/img/online-learning.png",
                        titre: "Cours annulés",
                        valeur: (getData("Annulé")).length),
                  ],
                ),
                const Gap(20),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const NearestCourse(),
                      const Gap(32),
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.cancelCourseSpaceColor,
                              borderRadius: BorderRadius.circular(12)),
                          child:
                              CancelCourse(sheduledCourses: getData("Annulé")),
                        ),
                      ),
                    ],
                  ),
                )
              ])),
        ));
  }
}

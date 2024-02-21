import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/ui/styles/color.dart';

class StatistiqueCard extends StatelessWidget {
  const StatistiqueCard(
      {super.key,
      required this.couleur,
      required this.icon,
      required this.titre,
      required this.valeur});
  final Color couleur;
  final String icon;
  final String titre;
  final int valeur;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 350,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: couleur, borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Image.asset(
          icon,
          scale: 6,
          color: AppColors.statistiqueCardTextColor,
        ),
        const Gap(16),
        Column(
          children: [
            Text(
              "$valeur",
              style: const TextStyle(
                  color: AppColors.statistiqueCardTextColor, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Gap(16),
            Text(titre, style: const TextStyle(
                  color: AppColors.statistiqueCardTextColor, fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        )
      ]),
    );
  }
}

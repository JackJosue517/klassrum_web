import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/ui/styles/color.dart';

class AppButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTapActions;
  final bool isSelected;
  const AppButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onTapActions,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapActions,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isSelected ? AppColors.buttonColors : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.buttonTextColors,
            ),
            const Gap(8),
            Text(
              text,
              style: const TextStyle(color: AppColors.buttonTextColors),
            )
          ],
        ),
      ),
    );
  }
}

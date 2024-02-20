import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(LineIcons.angleLeft),
      onTap: () => Navigator.pop(context),
    );
  }
}

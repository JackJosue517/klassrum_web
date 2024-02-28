import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/styles/color.dart';

class TableTile extends StatelessWidget {
  const TableTile({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: Color(0xFFEDEDED)),
        child: Text(
          text,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}

class TableHeaderTile extends StatelessWidget {
  const TableHeaderTile({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration:
            const BoxDecoration(color: AppColors.statistiqueCommingCardColor),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class UnchangeableCheckBox extends StatefulWidget {
  UnchangeableCheckBox(
      {super.key, required this.speciality, required this.isChecked});
  final String speciality;
  bool isChecked;

  @override
  State<UnchangeableCheckBox> createState() => _UnchangeableCheckBoxState();
}

class _UnchangeableCheckBoxState extends State<UnchangeableCheckBox> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.only(right: 16),
        /*decoration:
            const BoxDecoration(color: Color.fromARGB(255, 221, 237, 237)),*/
        child: Row(
          children: [
            Text(widget.speciality),
            const Gap(2),
            Checkbox(
              value: widget.isChecked,
              onChanged: (value) => {widget.isChecked == value},
            ),
          ],
        ),
      ),
    );
  }
}

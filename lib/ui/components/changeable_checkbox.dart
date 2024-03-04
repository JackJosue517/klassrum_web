import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class ChangeableCheckBox extends StatefulWidget {
  ChangeableCheckBox(
      {super.key, required this.speciality, required this.isChecked});
  final String speciality;
  bool isChecked;

  @override
  State<ChangeableCheckBox> createState() => _ChangeableCheckBoxState();
}

class _ChangeableCheckBoxState extends State<ChangeableCheckBox> {
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
              onChanged: (value) {
                setState(() {
                  widget.isChecked = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

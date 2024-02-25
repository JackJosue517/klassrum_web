import 'package:flutter/material.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';

class ReprogramPage extends StatefulWidget {
  const ReprogramPage({super.key, required this.sheduledCourse});
  final ShedulerCourse sheduledCourse;
  @override
  State<ReprogramPage> createState() => _ReprogramPageState();
}

class _ReprogramPageState extends State<ReprogramPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 500,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: const Column(
              children: [Text("Programmer un cours")],
            ),
          ),
        ),
        Container(
          width: 230,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/course_banner.jpg"),
                  fit: BoxFit.fill)),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/ui/components/cours_programmer_tile.dart';
import 'package:klassrum_web/ui/components/navigation_drawer.dart';
import 'package:klassrum_web/ui/styles/color.dart';

class CoursPage extends StatefulWidget {
  const CoursPage({super.key});

  @override
  State<CoursPage> createState() => _CoursPageState();
}

class _CoursPageState extends State<CoursPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cours'),
      ),
      drawer: const CustomNavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: FilledButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          AppColors.buttonColors),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Programmer un cours",
                    style: TextStyle(
                      color: AppColors.buttonTextColors,
                    ),
                  )),
            ),
            const Gap(24),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: CoursProgrammerTile(),
                //Column(children: List.generate(3, (index) => const MyApp())),
              ),
            )
          ],
        ),
      ),
    );
  }
}

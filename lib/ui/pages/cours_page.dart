import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/ui/components/cours_programmer_tile.dart';
import 'package:klassrum_web/ui/components/navigation_drawer.dart';
import 'package:klassrum_web/ui/styles/color.dart';
import 'package:klassrum_web/util/utils.dart';

class CoursPage extends StatefulWidget {
  const CoursPage({super.key});

  @override
  State<CoursPage> createState() => _CoursPageState();
}

class _CoursPageState extends State<CoursPage> {
  String selectedSortOption = 'Tout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cours'), actions: [
        Row(
          children: [
            const Text("Trier par"),
            const Gap(8),
            DropdownButton<String>(
              value: selectedSortOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSortOption = newValue!;
                });
              },
              items: <String>['Tout', 'Passé', 'A venir', 'Annulé']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ]),
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
                        return const Dialog(
                          child: Text("Correct"),
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
            const Gap(12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child:
                    CoursProgram(sheduledCourses: getData(selectedSortOption)),
                //Column(children: List.generate(3, (index) => const MyApp())),
              ),
            )
          ],
        ),
      ),
    );
  }

  
}

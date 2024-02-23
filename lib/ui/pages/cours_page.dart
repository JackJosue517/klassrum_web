import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/ui/components/after_course.dart';
import 'package:klassrum_web/ui/components/cancel_cours_card.dart';
import 'package:klassrum_web/ui/components/cours_programmer_tile.dart';
import 'package:klassrum_web/ui/components/future_course.dart';
import 'package:klassrum_web/ui/components/navigation_drawer.dart';
import 'package:klassrum_web/ui/pages/course_programmer_formula.dart';
import 'package:klassrum_web/ui/styles/color.dart';

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

                // Handle the selected sort option here
                handleSortOption(newValue);
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
                child: _getCourseTypeContent(selectedSortOption),
                //Column(children: List.generate(3, (index) => const MyApp())),
              ),
            )
          ],
        ),
      ),
    );
  }

  //la fonction qui va tout faire selon le l'option qui est selectionnée
  void handleSortOption(String? selectedOption) {
    // Implement your logic based on the selected sort option
    print('Selected Sort Option: $selectedOption');
    // You can perform different actions based on the selected option.
    // For example, you may want to sort the data differently.
  }

  Widget _getCourseTypeContent(String selectedOption) {
    Widget widget = const CoursProgram();
    if (selectedSortOption == "Passé") {}
    switch (selectedOption) {
      case "Passé":
        widget = const AfterCourseCard();
        break;
      case "A venir":
        widget = const FutureCourseCard();
        break;
      case "Annulé":
        widget = const CancelCourseCard();
        break;
      default:
        widget = const CoursProgram();
    }
    return widget;
  }
}

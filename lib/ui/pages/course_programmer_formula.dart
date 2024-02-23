import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/components/selected_textfield.dart';

class CourseProgrammerFormula extends StatefulWidget {
  const CourseProgrammerFormula({super.key});

  @override
  State<CourseProgrammerFormula> createState() =>
      _CourseProgrammerFormulaState();
}

class _CourseProgrammerFormulaState extends State<CourseProgrammerFormula> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 400,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white
        
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Programmer un cours",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Code"),
                      const SizedBox(width: 24),
                      DropDownTextField(
                          key: UniqueKey()), // Utilisation de UniqueKey
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

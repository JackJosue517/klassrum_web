import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddShedulerCourseForm extends StatefulWidget {
  const AddShedulerCourseForm({super.key});

  @override
  State<AddShedulerCourseForm> createState() => _AddShedulerCourseFormState();
}

class _AddShedulerCourseFormState extends State<AddShedulerCourseForm> {
  final courses = ["GEL 222", "Admin SYS"];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          const DefaultField(),
          const DefaultField(),
          DropdownButtonFormField(
            items: courses
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (value) {},
            decoration: InputDecoration(
                labelText: "Label",
                filled: true,
                fillColor: const Color(0xFFEDEDED),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none)),
          ),
          const Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextField(
              maxLines: 3,
              decoration: InputDecoration(
                  labelText: "Label",
                  filled: true,
                  fillColor: const Color(0xFFEDEDED),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none)),
            ),
          ),
          const Gap(24),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                    child: FilledButton(
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.red),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)))),
                        onPressed: () {},
                        child: const Text("Annuler"))),
                const Expanded(child: SizedBox()),
                Expanded(
                    child: FilledButton(
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.blue),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)))),
                        onPressed: () {},
                        child: const Text("Valider")))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DefaultField extends StatelessWidget {
  const DefaultField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFEDEDED),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none)),
            ),
          ],
        ));
  }
}

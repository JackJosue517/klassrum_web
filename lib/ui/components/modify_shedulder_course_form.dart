import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/data/models/app_shedule_course.dart';
import 'package:klassrum_web/ui/styles/color.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class AddShedulerCourseForm extends StatefulWidget {
  const AddShedulerCourseForm({super.key, required this.sc});
  final ShedulerCourse sc;

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
          const Text(
            "MODIFIER UNE SEANCE DE COURS",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.buttonColors),
            textAlign: TextAlign.center,
          ),
          const Gap(12),
          MultiSelectDropDown(
            hint: "Choisir les cours",
            clearIcon: const Icon(Icons.close),
            onOptionSelected: (options) {
              debugPrint(options.toString());
            },
            options: const <ValueItem>[
              ValueItem(label: 'GEL 122', value: 'GL'),
              ValueItem(label: 'GEL 121', value: 'MRI'),
              ValueItem(label: 'DHF 333333', value: 'mth'),
            ],
            selectionType: SelectionType.multi,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 300,
            optionTextStyle: const TextStyle(fontSize: 16),
            selectedOptionIcon: const Icon(Icons.check_circle),
          ),
          const DefaultField(
            labelText: "Theme",
          ),
          const Gap(8),
          MultiSelectDropDown(
            clearIcon: const Icon(Icons.close),
            hint: "Choisir les Specialités",
            onOptionSelected: (options) {
              debugPrint(options.toString());
            },
            options: const <ValueItem>[
              ValueItem(label: 'Genie Logiciel', value: 'GL'),
              ValueItem(label: 'Reseau', value: 'MRI'),
              ValueItem(label: 'Matematiques', value: 'mth'),
            ],
            selectionType: SelectionType.multi,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 300,
            optionTextStyle: const TextStyle(fontSize: 16),
            selectedOptionIcon: const Icon(Icons.check_circle),
          ),
          const Gap(8),
          DateFormatField(
            type: DateFormatType.type4,
            addCalendar: true,
            decoration: InputDecoration(
              labelText: widget.sc.date,
                hintText: "Date de la séance (jjmmaaaa)",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1))),
            onComplete: (date) {},
          ),
           Row(
            children: [
              Expanded(child: TimeField(labelText: widget.sc.heureDebut)),
              const Gap(8),
              Expanded(
                child: TimeField(labelText: widget.sc.heureDebut),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              maxLines: 2,
              decoration: InputDecoration(
                labelText: widget.sc.description,
                  hintText: "Description ou consignes",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1))),
            ),
          ),
          SizedBox(
            height: 50,
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
  const DefaultField({super.key, required this.labelText});
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: labelText,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1))),
            ),
          ],
        ));
  }
}

class TimeField extends StatefulWidget {
  const TimeField({super.key, required this.labelText});
  final String labelText;

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  TimeOfDay? time;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            TextField(
              readOnly: true,
              controller: TextEditingController(
                  text: time != null ? showTime(time!) : ""),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: widget.labelText,
                  suffixIcon: InkWell(
                    onTap: () async {
                      final result = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      if (result != null) {
                        setState(() {
                          time = result;
                        });
                      }
                    },
                    child: const Icon(Icons.timelapse),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1))),
            ),
          ],
        ));
  }
}

String showTime(TimeOfDay timeOfDay) {
  return "${timeOfDay.hour}H ${timeOfDay.minute}min";
}

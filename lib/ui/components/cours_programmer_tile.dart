import 'package:flutter/material.dart';

import 'package:klassrum_web/ui/styles/color.dart';

class CoursProgrammerTile extends StatelessWidget {
  const CoursProgrammerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("MATH 300"),
                  const Text("Algorithme Numerique", style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  const Text("Methode de Dicthotomie"),
                  const Text(
                    textAlign: TextAlign.center,
                    "30",style: TextStyle(
                    
                  ),),
                  const Text("14H-18H"),
                 
                  const Text("A venir"),
                Row(
                  children: [
                      FilledButton(
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.green),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)))),
                      onPressed: () {},
                      child: const Text(
                        "Editer",
                        style: TextStyle(
                          color: AppColors.buttonTextColors,
                        ),
                      )),
                 
                  ],
                )
                ],
              ),
    );
  }
}
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color couleur;
  final VoidCallback onTapActions;
  const AppButton({
    super.key,
    required this.text,
    required this.couleur,
    required this.onTapActions,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        child: FilledButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(couleur),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
          ),
          onPressed: () {
            /*showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: getRespectiveDialogPage(statut, sheduledCourse),
                    );
                  },
                );*/
            onTapActions();
          },
          child: Text(text),
        ),
      ),
    );
  }
}

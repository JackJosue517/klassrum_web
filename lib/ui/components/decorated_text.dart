import 'package:flutter/material.dart';

class DecoratedText extends StatelessWidget {
  const DecoratedText({super.key, required this.text, required this.couleur});
  final String text;
  final Color couleur;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
          border: Border.all(color: couleur, width: 2),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

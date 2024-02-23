import 'package:flutter/material.dart';

class DropDownTextField extends StatelessWidget {
  const DropDownTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        size: 24,
        color: Colors.black,
      ),
      items: const [
        DropdownMenuItem(
          value: "1",
          child: Text("A"),
        ),
        DropdownMenuItem(
          value: "2",
          child: Text("B"),
        )
      ],
      onChanged: (value) {},
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16),
        hintText: "Pays",
        filled: true,
        hintStyle: const TextStyle(
          color: Color(0xFF808080),
          fontSize: 16,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w400,
        ),
        fillColor: const Color(0xFFF6F6F6),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ),
    );
  }
}

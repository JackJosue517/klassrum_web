import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/styles/color.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.labelText,
    required this.icon,
  });

  final IconData icon;
  final String labelText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          contentPadding: const EdgeInsets.only(
            left: 20,
            right: 35,
          ),
          hintText: widget.labelText,
          filled: true,
          fillColor: const Color.fromRGBO(255, 255, 255, 1),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 1, color: AppColors.formularTextColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xFF1F41BB)),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

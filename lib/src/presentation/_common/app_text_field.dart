import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.controller,
  });

  final String hint;
  final Widget icon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hint,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          color: Color(0xFF454545),
        ),
      ),
    );
  }
}

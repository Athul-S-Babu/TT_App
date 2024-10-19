// widgets/custom_textfield.dart

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator; // Optional validator function
  final bool obscureText; // For password fields, if necessary

  CustomTextField({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false, // Default is false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
            borderSide: BorderSide(color: Colors.blue), // Border color
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
            borderSide: BorderSide(color: Colors.blueAccent), // Focused border color
          ),
        ),
        validator: validator, // Set validator if provided
      ),
    );
  }
}

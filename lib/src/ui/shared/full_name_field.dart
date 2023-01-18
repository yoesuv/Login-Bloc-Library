import 'package:flutter/material.dart';

class FullNameField extends StatelessWidget {
  final Function(String)? onChange;
  final String? errorMessage;

  FullNameField({
    required this.onChange,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: 'your full name',
        labelText: 'Full Name',
        errorText: errorMessage,
      ),
    );
  }
}

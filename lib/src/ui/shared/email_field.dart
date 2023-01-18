import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final Function(String)? onChange;
  final String? errorMessage;

  EmailField({
    required this.onChange,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'email@you.com',
        labelText: 'Email Address',
        errorText: errorMessage,
      ),
    );
  }
}

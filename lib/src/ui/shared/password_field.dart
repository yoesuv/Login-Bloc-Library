import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {

  final Function onChange;
  final String errorMessage;

  PasswordField({@required this.onChange, @required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: onChange,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            hintText: 'your password',
            labelText: 'Password',
            errorText: errorMessage
        )
    );
  }

}
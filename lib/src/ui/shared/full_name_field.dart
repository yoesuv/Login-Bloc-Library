import 'package:flutter/material.dart';

class FullNameField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.name,
        decoration: InputDecoration(
            hintText: 'your full name',
            labelText: 'Full Name',
        )
    );
  }

}
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {

  final Function onChange;
  final String errorMessage;

  PasswordField({@required this.onChange, @required this.errorMessage});

  @override
  PasswordFieldState createState() {
    return PasswordFieldState();
  }

}

class PasswordFieldState extends State<PasswordField>{

  bool _isToggle = true;

  void _passwordToggle() {
    setState(() {
      _isToggle = !_isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: widget.onChange,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isToggle,
        decoration: InputDecoration(
            hintText: 'your password',
            labelText: 'Password',
            errorText: widget.errorMessage,
            suffixIcon: InkWell(
              child: Icon(_isToggle ? Icons.visibility_off : Icons.visibility),
              onTap: () {
                _passwordToggle();
              },
            )
        )
    );
  }

}
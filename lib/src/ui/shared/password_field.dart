import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final Function(String)? onChange;
  final String? errorMessage;
  final bool isConfirmPassword;

  PasswordField({
    required this.onChange,
    this.errorMessage,
    this.isConfirmPassword = false,
  });

  @override
  PasswordFieldState createState() {
    return PasswordFieldState();
  }
}

class PasswordFieldState extends State<PasswordField> {
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
        hintText:
            widget.isConfirmPassword ? 'confirm password' : 'your password',
        labelText: widget.isConfirmPassword ? 'Confirm Password' : 'Password',
        errorText: widget.errorMessage,
        suffixIcon: InkWell(
          child: Icon(_isToggle ? Icons.visibility_off : Icons.visibility),
          onTap: () {
            _passwordToggle();
          },
        ),
      ),
    );
  }
}

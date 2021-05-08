import 'package:flutter/material.dart';
import 'package:login_bloc_library/src/ui/shared/email_field.dart';
import 'package:login_bloc_library/src/ui/shared/full_name_field.dart';

class RegisterScreen extends StatelessWidget {

  static const routeName = "register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _fullNameInput(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _fullNameInput() {
  return FullNameField();
}


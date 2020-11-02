import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              emailField(),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 20.0)),
              loginButton()
            ],
          ),
        )
    );
  }

  Widget emailField() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'email@you.com',
            labelText: 'Email Address',
        )
    );
  }

  Widget passwordField() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'your password',
          labelText: 'Password',
        )
    );
  }

  Widget loginButton() {
    return RaisedButton(
      onPressed: (){},
      child: Text('Login'),
      color: Colors.teal,
    );
  }

}
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:login_bloc_library/src/core/data/constants.dart';


class PasswordConfirm extends FormzInput<String, String> {

  const PasswordConfirm.pure({this.password}): super.pure('');
  const PasswordConfirm.dirty({@required this.password, String value = ''}):super.dirty(value);

  final String password;

  @override
  String validator(String value) {
    if (password != null) {
      if (value.trim().isEmpty) {
        return 'Password is Empty';
      } else if (value.trim().length < PASSWORD_MIN) {
        return 'Password Min $PASSWORD_MIN character';
      } else if (password != value) {
        return 'Confirm Password Did Not Match';
      } else {
        return null;
      }
    } else {
      return null;
    }

  }
}
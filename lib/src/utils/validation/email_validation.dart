import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';

class Email extends FormzInput<String, String> {

  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']): super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'Email is Empty';
    } else if (!EmailValidator.validate(value)) {
      return 'Email is not Valid';
    } else {
      return null;
    }
  }
}
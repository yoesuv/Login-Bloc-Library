import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';

enum EmailStatus {
  empty, not_valid
}

class Email extends FormzInput<String, EmailStatus> {

  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']): super.dirty(value);

  @override
  EmailStatus validator(String value) {
    if (value.isEmpty) {
      return EmailStatus.empty;
    } else if (!EmailValidator.validate(value)) {
      return EmailStatus.not_valid;
    } else {
      return null;
    }
  }
}
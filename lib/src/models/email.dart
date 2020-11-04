import 'package:formz/formz.dart';

enum EmailValidator {
  empty
}

class Email extends FormzInput<String, EmailValidator> {

  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']): super.dirty(value);

  @override
  EmailValidator validator(String value) {
    return value.isNotEmpty == true ? null : EmailValidator.empty;
  }

}
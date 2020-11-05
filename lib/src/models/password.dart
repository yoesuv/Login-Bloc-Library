import 'package:formz/formz.dart';

enum PasswordStatus {
  empty, min_char
}

class Password extends FormzInput<String, PasswordStatus> {

  const Password.pure(): super.pure('');
  const Password.dirty([String value = '']): super.dirty(value);

  @override
  PasswordStatus validator(String value) {
    if (value.isEmpty) {
      return PasswordStatus.empty;
    } else if (value.length < 3) {
      return PasswordStatus.min_char;
    } else {
      return null;
    }
  }

}
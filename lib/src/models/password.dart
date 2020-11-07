import 'package:formz/formz.dart';

class Password extends FormzInput<String, String> {

  const Password.pure(): super.pure('');
  const Password.dirty([String value = '']): super.dirty(value);

  @override
  String validator(String value) {
    if (value.isEmpty) {
      return 'Password is Empty';
    } else if (value.length < 3) {
      return 'Password Min 3 character';
    } else {
      return null;
    }
  }

}
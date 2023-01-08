import 'package:formz/formz.dart';
import 'package:login_bloc_library/src/core/data/constants.dart';

class Password extends FormzInput<String, String> {

  const Password.pure(): super.pure('');
  const Password.dirty([String value = '']): super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return 'Password is Empty';
    } else if (value.length < PASSWORD_MIN) {
      return 'Password Min $PASSWORD_MIN character';
    } else {
      return null;
    }
  }

}
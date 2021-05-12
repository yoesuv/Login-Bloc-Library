import 'package:formz/formz.dart';

class FullName extends FormzInput<String, String> {

  const FullName.pure(): super.pure('');
  const FullName.dirty([String value = '']): super.dirty(value);

  @override
  String validator(String value) {
    if (value.isEmpty) {
      return 'Full Name is Empty';
    } else if (value.length >= 256) {
      return 'Full Name is To Long';
    } else {
      return null;
    }
  }

}
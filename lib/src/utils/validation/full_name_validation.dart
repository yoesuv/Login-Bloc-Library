import 'package:formz/formz.dart';

class FullName extends FormzInput<String, String> {

  const FullName.pure(): super.pure('');
  const FullName.dirty([String value = '']): super.dirty(value);

  @override
  String? validator(String value) {
    // https://stackoverflow.com/a/57289735
    RegExp regExp = new RegExp(r'^[a-z A-Z,.\-]+$', caseSensitive: false);
    if (value.isEmpty) {
      return 'Full Name is Empty';
    } else if (!regExp.hasMatch(value.trim())) {
      return 'Full Name is Not Valid';
    } else if (value.length >= 256) {
      return 'Full Name is To Long';
    } else {
      return null;
    }
  }

}
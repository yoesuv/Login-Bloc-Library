import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:login_bloc_library/src/utils/validation/email_validation.dart';
import 'package:login_bloc_library/src/utils/validation/full_name_validation.dart';

class RegisterState extends Equatable {

  const RegisterState({
    this.status = FormzStatus.pure,
    this.fullName = const FullName.pure(),
    this.fullNameError,
    this.email = const Email.pure(),
    this.emailError
  });

  final FormzStatus status;
  final FullName fullName;
  final Email email;
  final String fullNameError, emailError;

  RegisterState copyWith({FormzStatus status, FullName fullName, String fullNameError, Email email, String emailError}) {
    return RegisterState(
      status: status ?? this.status,
      fullName: fullName ?? this.fullName,
      fullNameError: fullNameError,
      email: email ?? this.email,
      emailError: emailError
    );
  }

  @override
  List<Object> get props => [status, fullName, email];

}
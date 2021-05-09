import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:login_bloc_library/src/utils/validation/confirm_password_validation.dart';
import 'package:login_bloc_library/src/utils/validation/email_validation.dart';
import 'package:login_bloc_library/src/utils/validation/full_name_validation.dart';
import 'package:login_bloc_library/src/utils/validation/password_validation.dart';

class RegisterState extends Equatable {

  const RegisterState({
    this.status = FormzStatus.pure,
    this.fullName = const FullName.pure(),
    this.fullNameError,
    this.email = const Email.pure(),
    this.emailError,
    this.password = const Password.pure(),
    this.passwordError,
    this.confirmPassword = const ConfirmPassword.pure(),
    this.confirmPasswordError
  });

  final FormzStatus status;
  final FullName fullName;
  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final String fullNameError, emailError, passwordError, confirmPasswordError;

  RegisterState copyWith({FormzStatus status, FullName fullName, String fullNameError, Email email, String emailError,
    Password password, String passwordError, ConfirmPassword confirmPassword, String confirmPasswordError}) {
    return RegisterState(
      status: status ?? this.status,
      fullName: fullName ?? this.fullName,
      fullNameError: fullNameError,
      email: email ?? this.email,
      emailError: emailError,
      password: password ?? this.password,
      passwordError: passwordError,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      confirmPasswordError: confirmPasswordError
    );
  }

  @override
  List<Object> get props => [status, fullName, email, password, confirmPassword];

}
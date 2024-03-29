import 'package:equatable/equatable.dart';
import 'package:login_bloc_library/src/utils/validation/email_validation.dart';
import 'package:login_bloc_library/src/utils/validation/password_validation.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = false,
    this.email = const Email.pure(),
    this.emailError,
    this.password = const Password.pure(),
    this.passwordError,
  });

  final bool status;
  final Email email;
  final String? emailError, passwordError;
  final Password password;

  LoginState copyWith({
    bool? status,
    Email? email,
    String? emailError,
    Password? password,
    String? passwordError,
  }) {
    return LoginState(
        status: status ?? this.status,
        email: email ?? this.email,
        emailError: emailError,
        password: password ?? this.password,
        passwordError: passwordError);
  }

  @override
  List<Object> get props => [status, email, password];
}

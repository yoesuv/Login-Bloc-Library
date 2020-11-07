import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:login_bloc_library/src/models/email.dart';
import 'package:login_bloc_library/src/models/password.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.emailError,
    this.password = const Password.pure()
  });

  final FormzStatus status;
  final Email email;
  final String emailError;
  final Password password;

  LoginState copyWith({FormzStatus status, Email email, String emailError, Password password}) {
    return LoginState(
        status: status ?? this.status,
        email: email ?? this.email,
        emailError: emailError,
        password: password ?? this.password);
  }

  @override
  List<Object> get props => [status, email, password];
}
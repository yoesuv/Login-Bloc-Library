import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:login_bloc_library/src/models/email.dart';

class LoginState extends Equatable {
  const LoginState({this.status = FormzStatus.pure, this.email = const Email.pure()});

  final FormzStatus status;
  final Email email;

  LoginState copyWith(FormzStatus status, Email email) {
    return LoginState(status: status ?? this.status, email: email ?? this.email);
  }

  @override
  List<Object> get props => [status, email];
}
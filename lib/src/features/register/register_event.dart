import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}

class FullNameChanged extends RegisterEvent {
  const FullNameChanged(this.fullName);
  final String fullName;
  @override
  List<Object> get props => [fullName];
}

class EmailChanged extends RegisterEvent {
  const EmailChanged(this.email);
  final String email;
  @override
  List<Object> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);
  final String password;
  @override
  List<Object> get props => [password];
}

class RegisterConfirmPasswordChanged extends RegisterEvent {
  const RegisterConfirmPasswordChanged(this.confirmPassword);
  final String confirmPassword;
  @override
  List<Object> get props => [confirmPassword];
}

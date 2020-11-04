import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  const EmailChanged(this.email);
  final String email;
  @override
  List<Object> get props => [email];
}
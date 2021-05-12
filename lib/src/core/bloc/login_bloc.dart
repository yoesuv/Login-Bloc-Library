import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:login_bloc_library/src/core/event/login_event.dart';
import 'package:login_bloc_library/src/core/state/login_state.dart';
import 'package:login_bloc_library/src/utils/validation/email_validation.dart';
import 'package:login_bloc_library/src/utils/validation/password_validation.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(const LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield _emailChangedToState(event, state);
    } else if (event is PasswordChanged) {
      yield _passwordChangedToState(event, state);
    }
  }

  LoginState _emailChangedToState(EmailChanged event, LoginState state) {
    final email = Email.dirty(event.email);
    return state.copyWith(
        status: Formz.validate([state.email, email]),
        email: email,
        emailError: email.error
    );
  }

  LoginState _passwordChangedToState(PasswordChanged event, LoginState state) {
    final password = Password.dirty(event.password);
    return state.copyWith(
        status: Formz.validate([state.password, password]),
        password: password,
        passwordError: password.error
    );
  }

}
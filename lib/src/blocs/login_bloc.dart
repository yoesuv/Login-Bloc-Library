import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:login_bloc_library/src/blocs/login_event.dart';
import 'package:login_bloc_library/src/blocs/login_state.dart';
import 'package:login_bloc_library/src/models/email.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    yield _emailChangedToState(event, state);
  }

  LoginState _emailChangedToState(EmailChanged event, LoginState state) {
    final email = Email.dirty(event.email);
    return state.copyWith(Formz.validate([state.email, email]), email);
  }
}
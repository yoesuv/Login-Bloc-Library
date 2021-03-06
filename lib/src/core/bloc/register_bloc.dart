import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:login_bloc_library/src/core/event/register_event.dart';
import 'package:login_bloc_library/src/core/state/register_state.dart';
import 'package:login_bloc_library/src/utils/validation/email_validation.dart';
import 'package:login_bloc_library/src/utils/validation/full_name_validation.dart';
import 'package:login_bloc_library/src/utils/validation/password_validation.dart';
import 'package:login_bloc_library/src/utils/validation/password_confirm_validation.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  RegisterBloc(): super(const RegisterState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is FullNameChanged) {
      yield _fullNameChangedToState(event, state);
    } else if (event is EmailChanged) {
      yield _emailChangedToState(event, state);
    } else if (event is RegisterPasswordChanged) {
      yield _passwordChangedToState(event, state);
    } else if (event is RegisterConfirmPasswordChanged) {
      yield _confirmPasswordChangedToState(event, state);
    }
  }

  RegisterState _fullNameChangedToState(FullNameChanged event, RegisterState state) {
    final fullName = FullName.dirty(event.fullName);
    return state.copyWith(
      status: Formz.validate([state.fullName, fullName]),
      fullName: fullName,
      fullNameError: fullName.error
    );
  }

  RegisterState _emailChangedToState(EmailChanged event, RegisterState state) {
    final email = Email.dirty(event.email);
    return state.copyWith(
      status: Formz.validate([state.email, email]),
      email: email,
      emailError: email.error
    );
  }

  RegisterState _passwordChangedToState(RegisterPasswordChanged event, RegisterState state) {
    final password = Password.dirty(event.password);
    final confirmPassword = PasswordConfirm.dirty(password: password.value, value: state.passwordConfirm.value);
    return state.copyWith(
      status: Formz.validate([
        password,
        state.passwordConfirm
      ]),
      password: password,
      passwordConfirm: confirmPassword,
      passwordError: password.error
    );
  }

  RegisterState _confirmPasswordChangedToState(RegisterConfirmPasswordChanged event, RegisterState state) {
    final passwordConfirm = PasswordConfirm.dirty(password: state.password.value, value: event.confirmPassword);
    return state.copyWith(
      status: Formz.validate([
        state.password,
        passwordConfirm
      ]),
      passwordConfirm: passwordConfirm,
      passwordConfirmError: passwordConfirm.error
    );
  }

}
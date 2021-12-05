import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:login_bloc_library/src/core/event/register_event.dart';
import 'package:login_bloc_library/src/core/state/register_state.dart';
import 'package:login_bloc_library/src/utils/validation/email_validation.dart';
import 'package:login_bloc_library/src/utils/validation/full_name_validation.dart';
import 'package:login_bloc_library/src/utils/validation/password_validation.dart';
import 'package:login_bloc_library/src/utils/validation/password_confirm_validation.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  RegisterBloc(): super(const RegisterState()) {
    on<FullNameChanged>(_fullNameChanged);
    on<EmailChanged>(_emailChanged);
    on<RegisterPasswordChanged>(_passwordChanged);
    on<RegisterConfirmPasswordChanged>(_confirmPasswordChanged);
  }

  void _fullNameChanged(FullNameChanged event, Emitter<RegisterState> emit) {
    final fullName = FullName.dirty(event.fullName);
    emit(state.copyWith(
      status: Formz.validate([state.fullName, fullName]),
      fullName: fullName,
      fullNameError: fullName.error,
    ));
  }

  void _emailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      status: Formz.validate([state.email, email]),
      email: email,
      emailError: email.error,
    ));
  }

  void  _passwordChanged(RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    final password = Password.dirty(event.password);
    final confirmPassword = PasswordConfirm.dirty(password: password.value, value: state.passwordConfirm.value);
    emit(state.copyWith(
      status: Formz.validate([
        password,
        state.passwordConfirm
      ]),
      password: password,
      passwordConfirm: confirmPassword,
      passwordError: password.error,
    ));
  }

  void _confirmPasswordChanged(RegisterConfirmPasswordChanged event, Emitter<RegisterState> emit) {
    final passwordConfirm = PasswordConfirm.dirty(password: state.password.value, value: event.confirmPassword);
    emit(state.copyWith(
      status: Formz.validate([
        state.password,
        passwordConfirm
      ]),
      passwordConfirm: passwordConfirm,
      passwordConfirmError: passwordConfirm.error,
    ));
  }

}
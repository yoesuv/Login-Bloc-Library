import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:login_bloc_library/src/core/event/register_event.dart';
import 'package:login_bloc_library/src/core/state/register_state.dart';
import 'package:login_bloc_library/src/utils/validation/full_name_validation.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  RegisterBloc(): super(const RegisterState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is FullNameChanged) {
      yield _fullNameChangedToState(event, state);
    } else if (event is EmailChanged) {

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

}
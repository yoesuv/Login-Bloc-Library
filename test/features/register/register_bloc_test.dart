import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_bloc_library/src/features/register/register_bloc.dart';
import 'package:login_bloc_library/src/features/register/register_event.dart';
import 'package:login_bloc_library/src/features/register/register_state.dart';
import 'package:login_bloc_library/src/utils/validation/email_validation.dart';
import 'package:login_bloc_library/src/utils/validation/full_name_validation.dart';
import 'package:login_bloc_library/src/utils/validation/password_confirm_validation.dart';
import 'package:login_bloc_library/src/utils/validation/password_validation.dart';

void main() {
  group('RegisterBloc', () {
    late RegisterBloc bloc;

    setUp(() {
      bloc = RegisterBloc();
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state is correct', () {
      expect(bloc.state, equals(const RegisterState()));
      expect(bloc.state.status, isFalse);
      expect(bloc.state.fullName, equals(const FullName.pure()));
      expect(bloc.state.email, equals(const Email.pure()));
      expect(bloc.state.password, equals(const Password.pure()));
      expect(bloc.state.passwordConfirm, equals(const PasswordConfirm.pure()));
    });

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with fullNameError when FullNameChanged is empty',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const FullNameChanged('')),
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having(
              (s) => s.fullNameError,
              'fullNameError',
              'Full Name is Empty',
            )
            .having((s) => s.fullName.isValid, 'fullName.isValid', isFalse),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with fullNameError when FullNameChanged is invalid',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const FullNameChanged('John@Doe')),
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having(
              (s) => s.fullNameError,
              'fullNameError',
              'Full Name is Not Valid',
            )
            .having((s) => s.fullName.isValid, 'fullName.isValid', isFalse),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with valid fullName and no error',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const FullNameChanged('John Doe')),
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.fullNameError, 'fullNameError', isNull)
            .having((s) => s.fullName.isValid, 'fullName.isValid', isTrue),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with emailError when EmailChanged is empty',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const EmailChanged('')),
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.emailError, 'emailError', 'Email is Empty')
            .having((s) => s.email.isValid, 'email.isValid', isFalse),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with emailError when EmailChanged is invalid',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const EmailChanged('invalid-email')),
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.emailError, 'emailError', 'Email is not Valid')
            .having((s) => s.email.isValid, 'email.isValid', isFalse),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with valid email and no error',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const EmailChanged('test@example.com')),
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.emailError, 'emailError', isNull)
            .having((s) => s.email.isValid, 'email.isValid', isTrue),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with passwordError when RegisterPasswordChanged is empty',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const RegisterPasswordChanged('')),
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having(
              (s) => s.passwordError,
              'passwordError',
              'Password is Empty',
            )
            .having((s) => s.password.isValid, 'password.isValid', isFalse),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with passwordError when RegisterPasswordChanged is too short',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const RegisterPasswordChanged('abc')),
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having(
              (s) => s.passwordError,
              'passwordError',
              'Password Min 5 character',
            )
            .having((s) => s.password.isValid, 'password.isValid', isFalse),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with valid password and no error',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const RegisterPasswordChanged('password123')),
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.passwordError, 'passwordError', isNull)
            .having((s) => s.password.isValid, 'password.isValid', isTrue),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with passwordConfirmError when RegisterConfirmPasswordChanged is empty',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const RegisterConfirmPasswordChanged('')),
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having(
              (s) => s.passwordConfirmError,
              'passwordConfirmError',
              'Password is Empty',
            )
            .having(
              (s) => s.passwordConfirm.isValid,
              'passwordConfirm.isValid',
              isFalse,
            ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with passwordConfirmError when RegisterConfirmPasswordChanged does not match',
      build: () => RegisterBloc(),
      act: (bloc) {
        bloc.add(const RegisterPasswordChanged('password123'));
        bloc.add(const RegisterConfirmPasswordChanged('password456'));
      },
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.password.isValid, 'password.isValid', isTrue)
            .having((s) => s.passwordError, 'passwordError', isNull),
        isA<RegisterState>()
            .having(
              (s) => s.passwordConfirmError,
              'passwordConfirmError',
              'Confirm Password Did Not Match',
            )
            .having(
              (s) => s.passwordConfirm.isValid,
              'passwordConfirm.isValid',
              isFalse,
            ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with valid passwordConfirm and no error',
      build: () => RegisterBloc(),
      act: (bloc) {
        bloc.add(const RegisterPasswordChanged('password123'));
        bloc.add(const RegisterConfirmPasswordChanged('password123'));
      },
      expect: () => [
        isA<RegisterState>().having(
          (s) => s.password.isValid,
          'password.isValid',
          isTrue,
        ),
        isA<RegisterState>()
            .having(
              (s) => s.passwordConfirmError,
              'passwordConfirmError',
              isNull,
            )
            .having(
              (s) => s.passwordConfirm.isValid,
              'passwordConfirm.isValid',
              isTrue,
            ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with status true when all fields are valid',
      build: () => RegisterBloc(),
      act: (bloc) {
        bloc.add(const FullNameChanged('John Doe'));
        bloc.add(const EmailChanged('test@example.com'));
        bloc.add(const RegisterPasswordChanged('password123'));
        bloc.add(const RegisterConfirmPasswordChanged('password123'));
      },
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.fullNameError, 'fullNameError', isNull),
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.emailError, 'emailError', isNull),
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.passwordError, 'passwordError', isNull),
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having(
              (s) => s.passwordConfirmError,
              'passwordConfirmError',
              isNull,
            ),
        isA<RegisterState>()
            .having((s) => s.status, 'status', isTrue)
            .having(
              (s) => s.passwordConfirmError,
              'passwordConfirmError',
              isNull,
            ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [state] with status false when email becomes invalid after valid state',
      build: () => RegisterBloc(),
      act: (bloc) {
        bloc.add(const FullNameChanged('John Doe'));
        bloc.add(const EmailChanged('test@example.com'));
        bloc.add(const RegisterPasswordChanged('password123'));
        bloc.add(const RegisterConfirmPasswordChanged('password123'));
        bloc.add(const EmailChanged(''));
      },
      expect: () => [
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.fullNameError, 'fullNameError', isNull),
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.emailError, 'emailError', isNull),
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.passwordError, 'passwordError', isNull),
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having(
              (s) => s.passwordConfirmError,
              'passwordConfirmError',
              isNull,
            ),
        isA<RegisterState>().having((s) => s.status, 'status', isTrue),
        isA<RegisterState>()
            .having((s) => s.status, 'status', isTrue)
            .having((s) => s.email.isValid, 'email.isValid', isFalse),
        isA<RegisterState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.email.isValid, 'email.isValid', isFalse),
      ],
    );
  });
}

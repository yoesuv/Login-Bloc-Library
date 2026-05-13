import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_bloc_library/src/core/bloc/login_bloc.dart';
import 'package:login_bloc_library/src/core/event/login_event.dart';
import 'package:login_bloc_library/src/core/state/login_state.dart';
import 'package:login_bloc_library/src/utils/validation/email_validation.dart';
import 'package:login_bloc_library/src/utils/validation/password_validation.dart';

void main() {
  group('LoginBloc', () {
    late LoginBloc bloc;

    setUp(() {
      bloc = LoginBloc();
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state is correct', () {
      expect(bloc.state, equals(const LoginState()));
      expect(bloc.state.status, isFalse);
      expect(bloc.state.email, equals(const Email.pure()));
      expect(bloc.state.password, equals(const Password.pure()));
    });

    blocTest<LoginBloc, LoginState>(
      'emits [state] with emailError when EmailChanged is empty',
      build: () => LoginBloc(),
      act: (bloc) => bloc.add(const EmailChanged('')),
      expect: () => [
        isA<LoginState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.emailError, 'emailError', 'Email is Empty')
            .having((s) => s.email.isValid, 'email.isValid', isFalse),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [state] with emailError when EmailChanged is invalid',
      build: () => LoginBloc(),
      act: (bloc) => bloc.add(const EmailChanged('invalid-email')),
      expect: () => [
        isA<LoginState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.emailError, 'emailError', 'Email is not Valid')
            .having((s) => s.email.isValid, 'email.isValid', isFalse),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [state] with valid email and no error',
      build: () => LoginBloc(),
      act: (bloc) => bloc.add(const EmailChanged('test@example.com')),
      expect: () => [
        isA<LoginState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.emailError, 'emailError', isNull)
            .having((s) => s.email.isValid, 'email.isValid', isTrue),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [state] with passwordError when PasswordChanged is empty',
      build: () => LoginBloc(),
      act: (bloc) => bloc.add(const PasswordChanged('')),
      expect: () => [
        isA<LoginState>()
            .having((s) => s.status, 'status', isFalse)
            .having(
              (s) => s.passwordError,
              'passwordError',
              'Password is Empty',
            )
            .having((s) => s.password.isValid, 'password.isValid', isFalse),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [state] with passwordError when PasswordChanged is too short',
      build: () => LoginBloc(),
      act: (bloc) => bloc.add(const PasswordChanged('abc')),
      expect: () => [
        isA<LoginState>()
            .having((s) => s.status, 'status', isFalse)
            .having(
              (s) => s.passwordError,
              'passwordError',
              'Password Min 5 character',
            )
            .having((s) => s.password.isValid, 'password.isValid', isFalse),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [state] with valid password and no error',
      build: () => LoginBloc(),
      act: (bloc) => bloc.add(const PasswordChanged('password123')),
      expect: () => [
        isA<LoginState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.passwordError, 'passwordError', isNull)
            .having((s) => s.password.isValid, 'password.isValid', isTrue),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [state] with status true when both email and password are valid',
      build: () => LoginBloc(),
      act: (bloc) {
        bloc.add(const EmailChanged('test@example.com'));
        bloc.add(const PasswordChanged('password123'));
      },
      expect: () => [
        isA<LoginState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.emailError, 'emailError', isNull)
            .having((s) => s.passwordError, 'passwordError', isNull),
        isA<LoginState>()
            .having((s) => s.status, 'status', isTrue)
            .having((s) => s.emailError, 'emailError', isNull)
            .having((s) => s.passwordError, 'passwordError', isNull),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [state] with status false when email becomes invalid after valid password',
      build: () => LoginBloc(),
      act: (bloc) {
        bloc.add(const EmailChanged('test@example.com'));
        bloc.add(const PasswordChanged('password123'));
        bloc.add(const EmailChanged(''));
      },
      expect: () => [
        isA<LoginState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.emailError, 'emailError', isNull)
            .having((s) => s.passwordError, 'passwordError', isNull),
        isA<LoginState>()
            .having((s) => s.status, 'status', isTrue)
            .having((s) => s.emailError, 'emailError', isNull)
            .having((s) => s.passwordError, 'passwordError', isNull),
        isA<LoginState>()
            .having((s) => s.status, 'status', isFalse)
            .having((s) => s.emailError, 'emailError', 'Email is Empty')
            .having((s) => s.passwordError, 'passwordError', isNull),
      ],
    );
  });
}

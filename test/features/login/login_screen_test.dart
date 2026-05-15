import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_bloc_library/src/features/login/login_bloc.dart';
import 'package:login_bloc_library/src/features/login/login_event.dart';
import 'package:login_bloc_library/src/features/login/login_state.dart';
import 'package:login_bloc_library/src/features/login/login_screen.dart';
import 'package:login_bloc_library/src/features/register/register_screen.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  group('LoginScreen', () {
    late MockLoginBloc mockBloc;

    setUp(() {
      mockBloc = MockLoginBloc();
      when(() => mockBloc.state).thenReturn(const LoginState());
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: BlocProvider<LoginBloc>(
          create: (_) => mockBloc,
          child: LoginScreen(),
        ),
      );
    }

    testWidgets('displays login screen with all elements', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Login'), findsNWidgets(2));
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text('Register'), findsOneWidget);
    });

    testWidgets('adds EmailChanged event when email field changes', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.enterText(find.byType(TextField).first, 'test@example.com');
      await tester.pump();

      verify(
        () => mockBloc.add(const EmailChanged('test@example.com')),
      ).called(1);
    });

    testWidgets('adds PasswordChanged event when password field changes', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final passwordField = find.byType(TextField).last;
      await tester.enterText(passwordField, 'password123');
      await tester.pump();

      verify(
        () => mockBloc.add(const PasswordChanged('password123')),
      ).called(1);
    });

    testWidgets('navigates to register screen when Register button is tapped', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            RegisterScreen.routeName: (context) =>
                const Scaffold(body: Text('Register Screen')),
          },
          home: BlocProvider<LoginBloc>(
            create: (_) => mockBloc,
            child: LoginScreen(),
          ),
        ),
      );

      await tester.tap(find.text('Register'));
      await tester.pumpAndSettle();

      expect(find.text('Register Screen'), findsOneWidget);
    });
  });
}

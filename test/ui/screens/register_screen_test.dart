import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_bloc_library/src/core/bloc/register_bloc.dart';
import 'package:login_bloc_library/src/core/event/register_event.dart';
import 'package:login_bloc_library/src/core/state/register_state.dart';
import 'package:login_bloc_library/src/ui/screens/register_screen.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState>
    implements RegisterBloc {}

void main() {
  group('RegisterScreen', () {
    late MockRegisterBloc mockBloc;

    setUp(() {
      mockBloc = MockRegisterBloc();
      when(() => mockBloc.state).thenReturn(const RegisterState());
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: BlocProvider<RegisterBloc>(
          create: (_) => mockBloc,
          child: RegisterScreen(),
        ),
      );
    }

    testWidgets('displays register screen with all elements', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Register'), findsNWidgets(2));
      expect(find.byType(TextField), findsNWidgets(4));
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
    });

    testWidgets('adds FullNameChanged event when full name field changes', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.enterText(find.byType(TextField).at(0), 'John Doe');
      await tester.pump();

      verify(() => mockBloc.add(const FullNameChanged('John Doe'))).called(1);
    });

    testWidgets('adds EmailChanged event when email field changes', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.enterText(find.byType(TextField).at(1), 'test@example.com');
      await tester.pump();

      verify(
        () => mockBloc.add(const EmailChanged('test@example.com')),
      ).called(1);
    });

    testWidgets(
      'adds RegisterPasswordChanged event when password field changes',
      (tester) async {
        await tester.pumpWidget(createWidgetUnderTest());

        await tester.enterText(find.byType(TextField).at(2), 'password123');
        await tester.pump();

        verify(
          () => mockBloc.add(const RegisterPasswordChanged('password123')),
        ).called(1);
      },
    );

    testWidgets(
      'adds RegisterConfirmPasswordChanged event when confirm password field changes',
      (tester) async {
        await tester.pumpWidget(createWidgetUnderTest());

        await tester.enterText(find.byType(TextField).at(3), 'password123');
        await tester.pump();

        verify(
          () =>
              mockBloc.add(const RegisterConfirmPasswordChanged('password123')),
        ).called(1);
      },
    );

    testWidgets('register button is disabled when status is false', (
      tester,
    ) async {
      when(() => mockBloc.state).thenReturn(const RegisterState(status: false));
      await tester.pumpWidget(createWidgetUnderTest());

      final registerButton = find.widgetWithText(MaterialButton, 'Register');
      expect(registerButton, findsOneWidget);

      final button = tester.widget<MaterialButton>(registerButton);
      expect(button.onPressed, isNull);
    });

    testWidgets('register button is enabled when status is true', (
      tester,
    ) async {
      when(() => mockBloc.state).thenReturn(const RegisterState(status: true));
      await tester.pumpWidget(createWidgetUnderTest());

      final registerButton = find.widgetWithText(MaterialButton, 'Register');
      expect(registerButton, findsOneWidget);

      final button = tester.widget<MaterialButton>(registerButton);
      expect(button.onPressed, isNotNull);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_bloc_library/src/ui/shared/password_field.dart';

void main() {
  group('PasswordField', () {
    Widget createWidgetUnderTest({
      Function(String)? onChange,
      String? errorMessage,
      bool isConfirmPassword = false,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: PasswordField(
            onChange: onChange ?? (_) {},
            errorMessage: errorMessage,
            isConfirmPassword: isConfirmPassword,
          ),
        ),
      );
    }

    testWidgets('obscures text by default', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });

    testWidgets('shows visibility_off icon initially', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);
    });

    testWidgets('toggles to visible when icon is tapped', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isFalse);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);
    });

    testWidgets('toggles back to obscured when icon is tapped twice', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });

    testWidgets('calls onChange when text is entered', (tester) async {
      String? capturedValue;
      await tester.pumpWidget(
        createWidgetUnderTest(onChange: (value) => capturedValue = value),
      );

      await tester.enterText(find.byType(TextField), 'test123');

      expect(capturedValue, 'test123');
    });

    testWidgets('displays error message', (tester) async {
      await tester.pumpWidget(
        createWidgetUnderTest(errorMessage: 'Password is required'),
      );

      expect(find.text('Password is required'), findsOneWidget);
    });

    testWidgets('shows default password hint and label', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('your password'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('shows confirm password hint and label', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(isConfirmPassword: true));

      expect(find.text('confirm password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
    });
  });
}

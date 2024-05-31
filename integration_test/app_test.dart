import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_testing/home_screen.dart';
import 'package:integration_testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'end to end test',
    () {
      testWidgets(
        'verify login screen with correct username and password',
        (tester) async {
          const usernameKey = Key('username_controller');
          const passwordKey = Key('password_controller');

          await tester.pumpWidget(const app.MyApp());
          await tester.pumpAndSettle();

          await tester.enterText(find.byKey(usernameKey), 'username');
          await tester.enterText(find.byKey(passwordKey), 'password');

          await tester.tap(find.byType(ElevatedButton));
          await tester.pumpAndSettle();

          expect(find.byType(HomeScreen), findsOneWidget);
        },
      );
    },
  );
}

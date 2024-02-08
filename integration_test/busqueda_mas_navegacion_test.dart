import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:clima_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    await dotenv.load(fileName: '.env');
  });
  testWidgets('home-screen búsqueda más navegación (y tema oscuro)',
      (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MainApp()));

    expect(find.byIcon(Icons.mode_night), findsOneWidget);
    Finder changeThemeBtn = find.byIcon(Icons.mode_night);
    await tester.tap(changeThemeBtn);
    await tester.pumpAndSettle();

    expect(find.text(''), findsOneWidget);
    Finder textfield = find.text('');
    await tester.enterText(textfield, 'Venecia');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.sunny), findsOneWidget);
    changeThemeBtn = find.byIcon(Icons.sunny);
    await tester.tap(changeThemeBtn);
    await tester.pumpAndSettle();

    expect(find.text(''), findsOneWidget);
    textfield = find.text('');
    await tester.enterText(textfield, 'ojkowerwe');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.home), findsOneWidget);
    final homeButton = find.byIcon(Icons.home);
    await tester.tap(homeButton);
    await tester.pumpAndSettle();
  });
}

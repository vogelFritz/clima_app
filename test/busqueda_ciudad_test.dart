import 'package:clima_app/main.dart';
//import 'package:clima_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() async {
    await dotenv.load(fileName: '.env');
  });
  testWidgets('HomeScreen - Ciudad TextField', (tester) async {
    await tester.pumpWidget(const ProviderScope(
      child: MainApp(),
    ));
    await tester.enterText(find.byType(TextField), 'ffeewffweio');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(find.text(''), findsOneWidget);
  });
}

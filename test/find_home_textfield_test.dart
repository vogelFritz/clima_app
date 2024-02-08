import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:clima_app/main.dart';

void main() {
  testWidgets('There is a TextField in HomeScreen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MainApp()));
    expect(find.text(''), findsOneWidget);
  });
}

import 'package:clima_app/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    await dotenv.load(fileName: '.env');
  });
  testWidgets('home-screen búsqueda vacía', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MainApp()));
    expect(find.text(''), findsOneWidget);
    final textfield = find.text('');
    await tester.enterText(textfield, '');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text(''), findsOneWidget);
  });
}

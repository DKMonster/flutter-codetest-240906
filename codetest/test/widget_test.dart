import 'package:flutter_test/flutter_test.dart';
import 'package:codetest/flavors.dart';
import 'package:codetest/main.dart' as runner;

void main() {
  testWidgets('Test HomePage', (WidgetTester tester) async {
    F.appFlavor = Flavor.development;

    await runner.main();
    await tester.pumpAndSettle();

    expect(find.text('CodeTest Development'), findsOneWidget);
    expect(find.text('Hello CodeTest Production'), findsNothing);
    expect(find.text('Hello CodeTest Development'), findsOneWidget);
  });
}

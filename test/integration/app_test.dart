import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_assignment_axis/main.dart' as app;

void main() {
IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Load populars, tap first item, download image', (tester) async {
    await  app.main();
    await tester.pumpAndSettle();

    final listItem = find.byKey(const Key('popular_item_0'));
    await tester.ensureVisible(listItem);
    expect(listItem, findsOneWidget);

    await tester.tap(listItem);
    await tester.pumpAndSettle();

    final downloadButton = find.byKey(const Key('download_button'));
    expect(downloadButton, findsOneWidget);

    await tester.tap(downloadButton);
    await tester.pumpAndSettle();

    expect(find.textContaining('Saved'), findsOneWidget);
  });
}

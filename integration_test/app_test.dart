import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_assignment_axis/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Load populars, tap first item, download image', (tester) async {

    /// Run the app and wait until api call and design to be stable
    await app.main();
    await tester.pumpAndSettle();

    /// tap on the first item in the list
    final listItem = find.byKey(const Key('popular_item_0'));
    await tester.ensureVisible(listItem);
    expect(listItem, findsOneWidget);

    await tester.tap(listItem);
    await tester.pumpAndSettle();

    /// tap on the profile image
    final profileImage = find.byKey(const Key('popular_image'));
    await tester.ensureVisible(profileImage);
    expect(profileImage, findsOneWidget);

    await tester.tap(profileImage);
    await tester.pumpAndSettle();

    /// Download Image
    final downloadButton = find.byKey(const Key('download_button'));
    expect(downloadButton, findsOneWidget);

    await tester.tap(downloadButton);
    await tester.pumpAndSettle();
  });
}

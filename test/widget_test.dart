// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_api/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('IconButton navigates to favorites page when pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(GameApp());
    await tester.tap(find.byIcon(Icons.favorite_outline));
    await tester.pumpAndSettle();
    expect(find.text('Favorites'), findsOneWidget);
  });
}

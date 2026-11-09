import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retro_station/main.dart';

void main() {
  testWidgets('shows the Retro Station home screen', (tester) async {
    await tester.pumpWidget(const RetroStationApp());

    expect(find.text('Retro Station'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });
}

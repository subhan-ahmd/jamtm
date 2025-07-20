import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jamtm/screens/home/widgets/task_bottom_sheet.dart';

void main() {
  testWidgets('TaskBottomSheet displays inputs correctly', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: TaskBottomSheet()),
        ),
      ),
    );

    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
    expect(find.textContaining('Due Date'), findsOneWidget);
  });
}

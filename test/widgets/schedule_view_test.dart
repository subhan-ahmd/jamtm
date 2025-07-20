import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jamtm/screens/home/providers/filtered_tasks_provider.dart';
import 'package:jamtm/screens/schedule_view/schedule_view_screen.dart';
import 'package:jamtm/widgets/calendar_widget.dart';
import 'package:jamtm/models/task.dart';

void main() {
  group('ScheduleViewScreen Widget Tests', () {
    testWidgets('Shows Schedule Calendar with no tasks', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            filteredTasksProvider(upcoming: false).overrideWith(
              (ref) async => [],
            ),
          ],
          child: const MaterialApp(home: ScheduleViewScreen()),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CalendarWidget), findsOneWidget);
    });

    testWidgets('Shows Schedule Calendar with tasks', (tester) async {
      final fakeTasks = [
        Task(id: 1, title: 'Schedule Task', description: '', date: DateTime.now(), priority: 1),
      ];

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            filteredTasksProvider(upcoming: false).overrideWith(
              (ref) async => fakeTasks,
            ),
          ],
          child: const MaterialApp(home: ScheduleViewScreen()),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CalendarWidget), findsOneWidget);
    });
  });
}

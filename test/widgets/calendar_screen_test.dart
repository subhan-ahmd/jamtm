import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_task_manager/screens/calendar_view/calendar_view_screen.dart';
import 'package:mini_task_manager/screens/home/providers/filtered_tasks_provider.dart';
import 'package:mini_task_manager/widgets/calendar_widget.dart';
import 'package:mini_task_manager/models/task.dart';

void main() {
  group('CalendarViewScreen Widget Tests', () {
    testWidgets('Shows Calendar with no tasks', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            filteredTasksProvider(upcoming: false).overrideWith(
              (ref) async => [],
            ),
          ],
          child: const MaterialApp(home: CalendarViewScreen()),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CalendarWidget), findsOneWidget);
    });

    testWidgets('Shows Calendar with tasks', (tester) async {
      final fakeTasks = [
        Task(id: 1, title: 'Calendar Task', description: '', date: DateTime.now(), priority: 2),
      ];

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            filteredTasksProvider(upcoming: false).overrideWith(
              (ref) async => fakeTasks,
            ),
          ],
          child: const MaterialApp(home: CalendarViewScreen()),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CalendarWidget), findsOneWidget);
    });
  });
}

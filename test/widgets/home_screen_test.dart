import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jamtm/models/task.dart';
import 'package:jamtm/screens/home/home_screen.dart';
import 'package:jamtm/screens/home/providers/filtered_tasks_provider.dart';

void main() {
  group('HomeScreen Widget Tests', () {
    testWidgets('Shows loading state', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            filteredTasksProvider(upcoming: false).overrideWith(
              (ref) async => await Future.delayed(const Duration(seconds: 5)),
            ),
          ],
          child: const MaterialApp(home: HomeScreen()),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Shows error state', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            filteredTasksProvider(upcoming: false).overrideWith(
              (ref) async => throw Exception('Test error'),
            ),
          ],
          child: const MaterialApp(home: HomeScreen()),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.textContaining('Error'), findsOneWidget);
    });

    testWidgets('Shows empty state', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            filteredTasksProvider(upcoming: false).overrideWith(
              (ref) async => [],
            ),
          ],
          child: const MaterialApp(home: HomeScreen()),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('Shows tasks', (tester) async {
      final fakeTasks = [
        Task(id: 1, title: 'Task 1', description: '', date: DateTime.now(), priority: 1),
        Task(id: 2, title: 'Task 2', description: '', date: DateTime.now(), priority: 2),
      ];

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            filteredTasksProvider(upcoming: false).overrideWith(
              (ref) async => fakeTasks,
            ),
          ],
          child: const MaterialApp(home: HomeScreen()),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Task 1'), findsOneWidget);
      expect(find.text('Task 2'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}

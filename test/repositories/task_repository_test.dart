import 'package:flutter_test/flutter_test.dart';
import 'package:jamtm/data/repository/task_repository_impl.dart';
import 'package:jamtm/database/database.dart';
import 'package:drift/drift.dart';

void main() {
  late AppDb db;
  late TaskRepositoryImpl repository;

  setUp(() {
    db = AppDb.test();
    repository = TaskRepositoryImpl(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('Insert and retrieve task', () async {
    await repository.insert(
      TaskTableCompanion(
        title: const Value('Test Task'),
        priority: const Value(1),
        date: Value(DateTime.now().toIso8601String()),
      ),
    );

    final allTasks = await repository.getAll();
    expect(allTasks.length, 1);
    expect(allTasks.first.title, 'Test Task');
  });

  test('Filter tasks by priority', () async {
    await repository.insert(
      TaskTableCompanion(
        title: const Value('High Priority'),
        priority: const Value(3),
        date: Value(DateTime.now().toIso8601String()),
      ),
    );

    final results = await repository.filter(priority: 3);
    expect(results.length, 1);
    expect(results.first.priority, 3);
  });

  test('Filter tasks by dueDate or later', () async {
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));

    await repository.insert(
      TaskTableCompanion(
        title: const Value('Today Task'),
        date: Value(today.toIso8601String()),
        priority: const Value(1),
      ),
    );

    await repository.insert(
      TaskTableCompanion(
        title: const Value('Tomorrow Task'),
        date: Value(tomorrow.toIso8601String()),
        priority: const Value(1),
      ),
    );

    final results = await repository.filter(
      dueDate: today,
      dueDateOrLater: true,
    );
    expect(results.length, 2);
  });

  test('Delete task works', () async {
    final id = await repository.insert(
      TaskTableCompanion(
        title: const Value('Task to Delete'),
        date: Value(DateTime.now().toIso8601String()),
        priority: const Value(1),
      ),
    );

    await repository.delete(id);
    final allTasks = await repository.getAll();
    expect(allTasks.isEmpty, true);
  });

  test('Delete all tasks works', () async {
    await repository.insert(
      TaskTableCompanion(
        title: const Value('Task 1'),
        date: Value(DateTime.now().toIso8601String()),
        priority: const Value(1),
      ),
    );
    await repository.deleteAll();
    final allTasks = await repository.getAll();
    expect(allTasks.isEmpty, true);
  });

  test('Filter returns empty if no matching priority', () async {
    await repository.insert(
      TaskTableCompanion(
        title: const Value('High Priority'),
        priority: const Value(3),
        date: Value(DateTime.now().toIso8601String()),
      ),
    );

    final results = await repository.filter(priority: 1);
    expect(results.length, 0);
  });
}

import 'package:drift/drift.dart';
import 'package:jamtm/database/database.dart';
import 'package:jamtm/models/task.dart';

extension TaskMapping on Task {
  TaskTableCompanion toCompanion() {
    return TaskTableCompanion(
      id: id != null ? Value(id!) : const Value.absent(),
      title: Value(title),
      description: Value(description),
      date: Value(date.toIso8601String()),
      isCompleted: Value(isCompleted),
      priority: Value(priority),
    );
  }
}

extension TaskTableDataMapping on TaskTableData {
  Task toEntity() {
    return Task(
      id: id,
      title: title ?? '',
      description: description ?? '',
      date: DateTime.parse(date ?? DateTime.now().toIso8601String()),
      priority: priority ?? 1,
      isCompleted: isCompleted ?? false,
    );
  }
}

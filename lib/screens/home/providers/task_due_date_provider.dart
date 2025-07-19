import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_due_date_provider.g.dart';

@riverpod
class TaskDueDate extends _$TaskDueDate {
  @override
  DateTime? build() => null;

  void filterDueDate(DateTime? dueDate) => state = dueDate;
}
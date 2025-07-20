import 'package:riverpod_annotation/riverpod_annotation.dart';

 part 'task_priority_provider.g.dart';

@riverpod
class TaskPriority extends _$TaskPriority {
  @override
  int? build() => null;

  void filterPriority(int? priority) => state = priority;
}
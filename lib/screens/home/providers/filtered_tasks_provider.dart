import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/data/mappers/task_mappers.dart';
import 'package:mini_task_manager/models/task.dart';
import 'package:mini_task_manager/providers/task_repository_impl_provider.dart';
import 'package:mini_task_manager/screens/home/providers/task_due_date_provider.dart';
import 'package:mini_task_manager/screens/home/providers/task_priority_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_tasks_provider.g.dart';

@riverpod
Future<List<Task>> filteredTasks(Ref ref) {
  final repo = ref.watch(taskRepositoryProvider);
  final priority = ref.watch(taskPriorityProvider);
  final dueDate = ref.watch(taskDueDateProvider);
  return repo
      .filter(priority: priority, dueDate: dueDate)
      .then((tasks) => tasks.map((e) => e.toEntity()).toList());
}

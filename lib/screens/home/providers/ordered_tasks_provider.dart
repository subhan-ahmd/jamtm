import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/data/mappers/task_mappers.dart';
import 'package:mini_task_manager/models/task.dart';
import 'package:mini_task_manager/providers/task_repository_impl_provider.dart';
import 'package:mini_task_manager/screens/home/providers/task_descending_provider.dart';
import 'package:mini_task_manager/screens/home/providers/task_order_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ordered_tasks_provider.g.dart';

@riverpod
Future<List<Task>> orderedTasks(Ref ref) {
  final repo = ref.watch(taskRepositoryProvider);
  final orderBy = ref.watch(taskOrderByControllerProvider);
  final isDescending = ref.watch(taskDescendingControllerProvider);
  return repo
      .getAllOrdered(orderBy: orderBy, descending: isDescending)
      .then((tasks) => tasks.map((e) => e.toEntity()).toList());
}

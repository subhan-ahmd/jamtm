import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/data/repository/task_repository_impl.dart';
import 'package:mini_task_manager/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_repository_impl_provider.g.dart';

@riverpod
TaskRepositoryImpl taskRepository(Ref ref) {
  final db = AppDb();
  return TaskRepositoryImpl(db);
}
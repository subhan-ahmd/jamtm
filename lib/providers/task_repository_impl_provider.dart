import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jamtm/data/repository/task_repository_impl.dart';
import 'package:jamtm/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_repository_impl_provider.g.dart';

@riverpod
TaskRepositoryImpl taskRepository(Ref ref) {
  final db = AppDb();
  return TaskRepositoryImpl(db);
}
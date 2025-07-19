import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_descending_provider.g.dart';

@riverpod
class TaskDescendingController extends _$TaskDescendingController {
  @override
  bool build() => true;

  void toggle() => state = !state;
}
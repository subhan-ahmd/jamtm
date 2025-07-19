import 'package:mini_task_manager/models/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_task_provider.g.dart';

@riverpod
class NewTask extends _$NewTask {
  @override
  Task build({Task? initial}) {
    return initial ??
        Task(
          id: null,
          title: '',
          description: '',
          date: DateTime.now(),
          priority: 1,
          isCompleted: false,
        );
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updatePriority(int priority) {
    state = state.copyWith(priority: priority);
  }

  void updateDate(DateTime date) {
    state = state.copyWith(date: date);
  }
}


import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_tasks_provider.g.dart';

@riverpod
class SelectedTasks extends _$SelectedTasks {
  @override
  List<int> build() => [];

  void add(int id) => state = [...state, id];
  void remove(int id) => state = state.where((taskId) => taskId != id).toList();
  void addAll(List<int> tasks)=>state=tasks;
  void removeAll()=>state=[];
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/providers/task_repository_impl_provider.dart';
import 'package:mini_task_manager/screens/home/providers/ordered_tasks_provider.dart';
import 'package:mini_task_manager/screens/home/providers/selected_tasks_provider.dart';
import 'package:mini_task_manager/screens/home/widgets/task_bottom_sheet.dart';
import 'package:mini_task_manager/screens/home/widgets/task_tile.dart';
import 'package:mini_task_manager/widgets/basic_bottom_sheet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(orderedTasksProvider);
    final selectedTasks = ref.watch(selectedTasksProvider);
    return Scaffold(
      appBar: AppBar(
        title: selectedTasks.isEmpty
            ? Text("Mini Task Manager")
            : IconButton(
                onPressed: () {
                  ref.read(selectedTasksProvider.notifier).removeAll();
                },
                icon: Icon(Icons.close),
              ),
        actions: selectedTasks.isNotEmpty
            ? [
                tasks.when(
                  data: (tasks) => tasks.length != selectedTasks.length
                      ? IconButton(
                          onPressed: () async {
                            List<int> allTasks = (await ref.read(
                              orderedTasksProvider.future,
                            )).map((task) => task.id!).toList();
                            ref
                                .read(selectedTasksProvider.notifier)
                                .addAll(allTasks);
                          },
                          icon: Icon(Icons.select_all),
                        )
                      : Container(),
                  error: (error, stackTrace) => Container(),
                  loading: () => Container(),
                ),

                IconButton(
                  onPressed: () async {
                    List allTasks = (await ref.read(
                      orderedTasksProvider.future,
                    ));
                    if (allTasks.length == selectedTasks.length) {
                      await ref.read(taskRepositoryProvider).deleteAll();
                    } else {
                      selectedTasks.forEach(
                        (task) async =>
                            await ref.read(taskRepositoryProvider).delete(task),
                      );
                    }
                     ref.read(selectedTasksProvider.notifier).removeAll();
                    ref.invalidate(orderedTasksProvider);
                  },
                  icon: Icon(Icons.delete_rounded),
                ),
              ]
            : null,
      ),
      body: tasks.when(
        data: (tasks) {
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskTile(
                task: task,
                onTap: selectedTasks.isEmpty
                    ? () {
                        BasicBottomSheet.openSheet(
                          context,
                          TaskBottomSheet(existingTask: task),
                          isScrollControlled: true,
                        );
                      }
                    : () {
                        if (selectedTasks.contains(task.id)) {
                          ref
                              .read(selectedTasksProvider.notifier)
                              .remove(task.id!);
                        } else {
                          ref
                              .read(selectedTasksProvider.notifier)
                              .add(task.id!);
                        }
                      },
                onLongPress: () {
                  if (selectedTasks.contains(task.id)) {
                    ref.read(selectedTasksProvider.notifier).remove(task.id!);
                  } else {
                    ref.read(selectedTasksProvider.notifier).add(task.id!);
                  }
                },
              );
            },
          );
        },
        error: (error, stackTrace) => Center(child: Text("Error: $error")),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        onPressed: () {
          BasicBottomSheet.openSheet(
            context,
            TaskBottomSheet(),
            isScrollControlled: true,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

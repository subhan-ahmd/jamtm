import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/providers/task_repository_impl_provider.dart';
import 'package:mini_task_manager/screens/home/providers/filtered_tasks_provider.dart';
import 'package:mini_task_manager/screens/home/providers/selected_tasks_provider.dart';
import 'package:mini_task_manager/screens/home/providers/task_due_date_provider.dart';
import 'package:mini_task_manager/screens/home/providers/task_priority_provider.dart';
import 'package:mini_task_manager/screens/home/widgets/task_bottom_sheet.dart';
import 'package:mini_task_manager/screens/home/widgets/task_tile.dart';
import 'package:mini_task_manager/utils/color_manager.dart';
import 'package:mini_task_manager/utils/theme_manager.dart';
import 'package:mini_task_manager/widgets/basic_bottom_sheet.dart';
import 'package:mini_task_manager/widgets/basic_button.dart';
import 'package:mini_task_manager/widgets/new_task_fab.dart';
import 'package:mini_task_manager/widgets/loading_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(filteredTasksProvider());
    final selectedTasks = ref.watch(selectedTasksProvider);
    final priority = ref.watch(taskPriorityProvider);
    final dueDate = ref.watch(taskDueDateProvider);
    return Scaffold(
      floatingActionButton: NewTaskFab(),
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
                              filteredTasksProvider().future,
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
                      filteredTasksProvider().future,
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
                    ref.invalidate(filteredTasksProvider);
                  },
                  icon: Icon(Icons.delete_rounded),
                ),
              ]
            : null,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: double.maxFinite,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ThemeManager.horizontalPadding,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8,
                  children: [
                    SegmentedButton(
                      segments: [1, 2, 3].map((value) {
                        return ButtonSegment(
                          value: value,
                          label: Text(priorityLabels[value]!),
                        );
                      }).toList(),
                      selected: priority != null ? {priority} : {},
                      emptySelectionAllowed: true,
                      showSelectedIcon: false,
                      onSelectionChanged: (selected) {
                        ref
                            .read(taskPriorityProvider.notifier)
                            .filterPriority(
                              selected.isNotEmpty ? selected.first : null,
                            );
                      },
                    ),
                    BasicButton(
                      data: dueDate != null
                          ? "Due: ${dueDate.toLocal().toIso8601String().split('T').first}"
                          : "Due Date",
                      paddingSize: const Size(80, 45),
                      onPressed: () async {
                        DateTime startDate = DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                        );
                        ref
                            .read(taskDueDateProvider.notifier)
                            .filterDueDate(
                              await showDatePicker(
                                context: context,
                                initialDate: startDate,
                                firstDate: startDate,
                                lastDate: DateTime(2050),
                              ),
                            );
                      },
                    ),
                    if (priority != null || dueDate != null)
                      BasicButton(
                        data: "",
                        icon: Icon(Icons.close, color: ColorManager.red),
                        noPadding: true,
                        paddingSize: const Size(45, 45),
                        onPressed: () async {
                          ref
                              .read(taskDueDateProvider.notifier)
                              .filterDueDate(null);
                          ref
                              .read(taskPriorityProvider.notifier)
                              .filterPriority(null);
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ThemeManager.horizontalPadding,
              ),
              child: tasks.when(
                data: (tasks) => ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TaskTile(
                      task: task,
                      selected: selectedTasks.contains(task.id),
                      selection: selectedTasks.isNotEmpty,
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
                          ref
                              .read(selectedTasksProvider.notifier)
                              .remove(task.id!);
                        } else {
                          ref
                              .read(selectedTasksProvider.notifier)
                              .add(task.id!);
                        }
                      },
                    );
                  },
                ),
                loading: () => LoadingWidget(),
                error: (error, stackTrace) =>
                    Center(child: Text("Error: $error")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

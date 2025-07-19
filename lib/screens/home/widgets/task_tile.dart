import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/models/task.dart';
import 'package:mini_task_manager/screens/home/providers/selected_tasks_provider.dart';
import 'package:mini_task_manager/screens/home/widgets/task_bottom_sheet.dart';

class TaskTile extends ConsumerWidget {
  final Task task;
  final void Function()? onTap;
  final void Function()? onLongPress;
  const TaskTile({super.key,
    required this.task,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTasks = ref.watch(selectedTasksProvider);
    return Card(
      color: selectedTasks.contains(task.id) ? Colors.blue[50] : null,
      child: ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        title: Text(task.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.description),
            Text("Due: ${task.date.toLocal()}"),
            Text("Priority: ${priorityLabels[task.priority]}"),
          ],
        ),
        trailing: Icon(
          task.isCompleted ? Icons.check_circle : Icons.circle_outlined,
          color: task.isCompleted ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}

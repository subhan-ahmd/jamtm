import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/models/task.dart';
import 'package:mini_task_manager/screens/home/widgets/priority_bubble.dart';
import 'package:mini_task_manager/utils/theme_manager.dart';
import 'package:mini_task_manager/widgets/basic_checkbox.dart';

class TaskTile extends ConsumerWidget {
  final Task task;
  final bool selected;
  final bool selection;
  final void Function()? onTap;
  final void Function()? onLongPress;
  const TaskTile({
    super.key,
    required this.task,
    required this.selected,
    required this.selection,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: selected ? Colors.blue[50] : null,
      child: ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        title: Row(
          spacing: 4,
          children: [
            Expanded(child: Text(task.title, overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold))),
            PriorityBubble(priority: task.priority)
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.description, maxLines: 2, overflow: TextOverflow.ellipsis,),
            Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Due on ',
                      ),
                      TextSpan(
                        text: ThemeManager.dateFormat.format(task.date),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,

                    // color: AppColors.genderSelectionColor,
                  ),
                ),

          ],
        ),
        trailing: selection
            ? BasicCheckbox(value: selected, onChanged: (val) => onTap!())
            : null,
      ),
    );
  }
}

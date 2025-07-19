import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/data/mappers/task_mappers.dart';
import 'package:mini_task_manager/models/task.dart';
import 'package:mini_task_manager/providers/task_repository_impl_provider.dart';
import 'package:mini_task_manager/screens/home/providers/new_task_provider.dart';
import 'package:mini_task_manager/screens/home/providers/ordered_tasks_provider.dart';
import 'package:mini_task_manager/screens/home/providers/read_only_provider.dart';
import 'package:mini_task_manager/widgets/basic_bottom_sheet.dart';
import 'package:mini_task_manager/widgets/basic_button.dart';
import 'package:mini_task_manager/widgets/basic_radio.dart';
import 'package:mini_task_manager/widgets/basic_text_field.dart';

const Map<int, String> priorityLabels = {1: "Low", 2: "Medium", 3: "High"};

class TaskBottomSheet extends ConsumerStatefulWidget {
  final Task? existingTask;
  const TaskBottomSheet({super.key, this.existingTask});

  @override
  ConsumerState createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends ConsumerState<TaskBottomSheet> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dueDateController;

  @override
  void initState() {
    super.initState();
    final task = ref.read(newTaskProvider(initial: widget.existingTask));
    titleController = TextEditingController(text: task.title);
    descriptionController = TextEditingController(text: task.description);
    dueDateController = TextEditingController(
      text: widget.existingTask != null
          ? task.date.toLocal().toString().split(' ')[0]
          : task.date.toLocal().toString(),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final task = ref.watch(newTaskProvider(initial: widget.existingTask));
    final readOnly = ref.watch(readOnlyProvider(widget.existingTask?.id));
    return BasicBottomSheet(
      child: SingleChildScrollView(
        child: Column(
          spacing: 12,
          children: [
            BasicTextField(
              controller: titleController,
              label: "Title",
              readOnly: widget.existingTask != null && readOnly,
              onChanged: (value) {
                ref
                    .read(
                      newTaskProvider(initial: widget.existingTask).notifier,
                    )
                    .updateTitle(value);
              },
            ),
            BasicTextField(
              controller: descriptionController,
              label: "Description",
              readOnly: widget.existingTask != null && readOnly,
              onChanged: (value) {
                ref
                    .read(
                      newTaskProvider(initial: widget.existingTask).notifier,
                    )
                    .updateDescription(value);
              },
            ),
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [1, 2, 3].map((value) {
                  return Expanded(
                    child: BasicRadio<int>(
                      label: priorityLabels[value]!,
                      value: value,
                      groupValue: task.priority,
                      onChanged: (widget.existingTask != null && readOnly)
                          ? null
                          : (selected) {
                              if (selected != null) {
                                ref
                                    .read(
                                      newTaskProvider(
                                        initial: widget.existingTask,
                                      ).notifier,
                                    )
                                    .updatePriority(selected);
                              }
                            },
                    ),
                  );
                }).toList(),
              ),
            ),
            widget.existingTask != null && readOnly
                ? BasicTextField(
                    controller: dueDateController,
                    label: "Due Date",
                    readOnly: widget.existingTask != null && readOnly,
                  )
                : SizedBox(
                    height: 200,
                    width: double.maxFinite,
                    child: CupertinoDatePicker(
                      itemExtent: 50,
                      backgroundColor: Colors.white,
                      minimumDate: DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                      ),
                      initialDateTime: task.date,
                      maximumDate: DateTime(2050),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (date) {
                        ref
                            .read(
                              newTaskProvider(
                                initial: widget.existingTask,
                              ).notifier,
                            )
                            .updateDate(date);
                      },
                    ),
                  ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: BasicButton(
                      data: widget.existingTask != null
                          ? (readOnly ? "Edit Task" : "Update Task")
                          : "Add Task",
                      onPressed: () async {
                        final updatedTask = ref.read(
                          newTaskProvider(initial: widget.existingTask),
                        );

                        if (widget.existingTask != null) {
                          if (readOnly) {
                            ref
                                .read(
                                  readOnlyProvider(
                                    widget.existingTask?.id,
                                  ).notifier,
                                )
                                .toggle();
                          } else {
                            await ref
                                .read(taskRepositoryProvider)
                                .update(
                                  widget.existingTask!.id!,
                                  updatedTask.toCompanion(),
                                );
                            ref.invalidate(orderedTasksProvider);
                          }
                        } else {
                          await ref
                              .read(taskRepositoryProvider)
                              .insert(updatedTask.toCompanion());
                          ref.invalidate(orderedTasksProvider);
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

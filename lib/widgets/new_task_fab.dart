import 'package:flutter/material.dart';
import 'package:mini_task_manager/screens/home/widgets/task_bottom_sheet.dart';
import 'package:mini_task_manager/widgets/basic_bottom_sheet.dart';

class NewTaskFab extends StatelessWidget {
  const NewTaskFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        tooltip: 'Add',
        onPressed: () {
          BasicBottomSheet.openSheet(
            context,
            TaskBottomSheet(),
            isScrollControlled: true,
          );
        },
        child: const Icon(Icons.add),
      );
  }
}

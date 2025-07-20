import 'package:flutter/material.dart';
import 'package:mini_task_manager/screens/home/widgets/task_bottom_sheet.dart';
import 'package:mini_task_manager/utils/color_manager.dart';

class PriorityBubble extends StatelessWidget {
  final int priority;
  const PriorityBubble({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: ColorManager.priorities[priority] ?? ColorManager.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: ColorManager.priorities[priority] ?? ColorManager.black,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Text(
        priorityLabels[priority]!,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ColorManager.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          // fontFamily: 'SF Pro Text',
          // height: 0.12,
        ),
      ),
    );
  }
}
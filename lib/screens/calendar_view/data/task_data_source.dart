import 'package:mini_task_manager/models/task.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

class TaskDataSource extends CalendarDataSource {
  TaskDataSource(List<Task> tasks) {
    appointments = tasks.map((task) {
      return Appointment(
        startTime: task.date,
        endTime: task.date.add(Duration(hours: 1)),
        subject: task.title ?? 'No Title',
        color: _getPriorityColor(task.priority),
        notes: task.description,
        isAllDay: true,
      );
    }).toList();
  }

  Color _getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }
}
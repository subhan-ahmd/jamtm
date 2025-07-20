import 'package:mini_task_manager/models/task.dart';
import 'package:mini_task_manager/utils/color_manager.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TaskDataSource extends CalendarDataSource {
  TaskDataSource(List<Task> tasks) {
    appointments = tasks.map((task) {
      return Appointment(
        id: task.id,
        startTime: task.date,
        endTime: task.date.add(Duration(hours: 1)),
        subject: task.title,
        color: ColorManager.priorities[task.priority]!,
        notes: task.description,
        isAllDay: true,
      );
    }).toList();
  }
}

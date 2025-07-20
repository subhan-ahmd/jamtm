import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/models/task.dart';
import 'package:mini_task_manager/screens/calendar_view/data/task_data_source.dart';
import 'package:mini_task_manager/screens/home/providers/filtered_tasks_provider.dart';
import 'package:mini_task_manager/screens/home/widgets/task_bottom_sheet.dart';
import 'package:mini_task_manager/widgets/basic_bottom_sheet.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends ConsumerWidget {
  final List<Task> tasks;
  final CalendarView view;
  final ScheduleViewSettings scheduleViewSettings;
  final MonthViewSettings monthViewSettings;
  const CalendarWidget({
    super.key,
    this.tasks = const [],
    this.view = CalendarView.day,
    this.scheduleViewSettings = const ScheduleViewSettings(),
    this.monthViewSettings = const MonthViewSettings(),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SfCalendar(
      dataSource: TaskDataSource(tasks),
      view: view,
      scheduleViewSettings: scheduleViewSettings,
      monthViewSettings: monthViewSettings,
      initialSelectedDate: DateTime.now(),
      onTap: (CalendarTapDetails details) async {
        if (details.targetElement == CalendarElement.appointment) {
          final Appointment? appointment = details.appointments?.first;
          if (appointment != null) {
            final taskId = appointment.id as int?;
            List matchingTasks = (await ref.read(
              filteredTasksProvider().future,
            )).where((task) => task.id == taskId).toList();
            BasicBottomSheet.openSheet(
              context,
              TaskBottomSheet(existingTask: matchingTasks.first),
              isScrollControlled: true,
            );
          }
        }
      },
    );
  }
}

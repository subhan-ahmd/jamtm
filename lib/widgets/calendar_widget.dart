import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jamtm/models/task.dart';
import 'package:jamtm/screens/calendar_view/data/task_data_source.dart';
import 'package:jamtm/screens/home/providers/filtered_tasks_provider.dart';
import 'package:jamtm/screens/home/widgets/task_bottom_sheet.dart';
import 'package:jamtm/utils/color_manager.dart';
import 'package:jamtm/widgets/basic_bottom_sheet.dart';
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
      todayHighlightColor: ColorManager.accent,
      cellBorderColor: ColorManager.accent,
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
      headerStyle: CalendarHeaderStyle(
        backgroundColor: ColorManager.background,
        textStyle: TextStyle(color: ColorManager.primaryText),
      ),
    );
  }
}

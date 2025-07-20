import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/screens/calendar_view/data/task_data_source.dart';
import 'package:mini_task_manager/screens/home/providers/filtered_tasks_provider.dart';
import 'package:mini_task_manager/screens/home/widgets/task_bottom_sheet.dart';
import 'package:mini_task_manager/widgets/basic_bottom_sheet.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleViewScreen extends ConsumerWidget {
  const ScheduleViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(filteredTasksProvider());
    return Scaffold(
      appBar: AppBar(title: const Text('Schedule View')),
      body: tasks.when(
        data: (tasks) => SfCalendar(
          view: CalendarView.schedule,
          dataSource: TaskDataSource(tasks),
          scheduleViewSettings: ScheduleViewSettings(
            hideEmptyScheduleWeek: true,
          ),
          initialSelectedDate: DateTime.now(),
          onTap: (CalendarTapDetails details) async {
            if (details.targetElement == CalendarElement.appointment) {
              final Appointment? appointment = details.appointments?.first;
              if (appointment != null) {
                final taskId = appointment.id as int?;
                List matchingTasks = (await ref.read(
                      filteredTasksProvider().future,
                    )).where((task)=> task.id == taskId).toList();
                BasicBottomSheet.openSheet(
                  context,
                  TaskBottomSheet(existingTask: matchingTasks.first),
                  isScrollControlled: true,
                );
              }
            }
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

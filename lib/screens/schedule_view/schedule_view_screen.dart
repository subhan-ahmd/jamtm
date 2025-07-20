import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jamtm/screens/home/providers/filtered_tasks_provider.dart';
import 'package:jamtm/widgets/new_task_fab.dart';
import 'package:jamtm/widgets/calendar_widget.dart';
import 'package:jamtm/widgets/loading_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleViewScreen extends ConsumerWidget {
  const ScheduleViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(filteredTasksProvider());
    return Scaffold(
      floatingActionButton: NewTaskFab(),
      appBar: AppBar(title: const Text('Schedule View')),
      body: tasks.when(
        data: (tasks) => CalendarWidget(
          tasks: tasks,
          view: CalendarView.schedule,
          scheduleViewSettings: ScheduleViewSettings(
            hideEmptyScheduleWeek: true,
          ),
        ),
        loading: () => LoadingWidget(),
        error: (e, stackTrace) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

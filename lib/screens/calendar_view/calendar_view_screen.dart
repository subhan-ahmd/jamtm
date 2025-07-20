import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/screens/home/providers/filtered_tasks_provider.dart';
import 'package:mini_task_manager/widgets/basic_scaffold/new_task_fab.dart';
import 'package:mini_task_manager/widgets/calendar_widget.dart';
import 'package:mini_task_manager/widgets/loading_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarViewScreen extends ConsumerWidget {
  const CalendarViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(filteredTasksProvider());
    return Scaffold(
      floatingActionButton: NewTaskFab(),
      appBar: AppBar(title: const Text('Calendar View')),
      body: tasks.when(
        data: (tasks) => CalendarWidget(
          tasks: tasks,
          view: CalendarView.month,
          monthViewSettings: MonthViewSettings(showAgenda: true),
        ),
        loading: () => LoadingWidget(),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

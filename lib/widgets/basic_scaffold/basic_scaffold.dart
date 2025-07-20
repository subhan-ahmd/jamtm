import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/screens/calendar_view/calendar_view_screen.dart';
import 'package:mini_task_manager/screens/schedule_view/schedule_view_screen.dart';
import 'package:mini_task_manager/widgets/basic_scaffold/providers/current_tab_provider.dart';
import 'package:mini_task_manager/screens/home/home_screen.dart';

class BasicScaffold extends ConsumerWidget {
  const BasicScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(currentTabProvider);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          ref.read(currentTabProvider.notifier).toggle(index);
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentTab,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.task),
            icon: Icon(Icons.task_outlined),
            label: 'Tasks',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_today),
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Calendar View',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_view_day),
            icon: Icon(Icons.calendar_view_day_outlined),
            label: 'Schedule View',
          ),
        ],
      ),
      body: <Widget>[
        HomeScreen(),
        CalendarViewScreen(),
        ScheduleViewScreen(),
      ][currentTab],
    );
  }
}

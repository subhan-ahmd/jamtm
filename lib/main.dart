import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jamtm/screens/calendar_view/calendar_view_screen.dart';
import 'package:jamtm/screens/home/home_screen.dart';
import 'package:jamtm/screens/schedule_view/schedule_view_screen.dart';
import 'package:jamtm/utils/theme_manager.dart';
import 'package:jamtm/widgets/basic_scaffold/basic_scaffold.dart';

void main() {
  runApp(ProviderScope(child: const MiniTaskManager()));
}

class MiniTaskManager extends StatelessWidget {
  const MiniTaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Task Manager',
      themeMode: ThemeMode.light,
      theme: ThemeManager.appTheme,
      home: BasicScaffold(
         destinations: const <NavigationDestination>[
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
        screens: <Widget>[
        HomeScreen(),
        CalendarViewScreen(),
        ScheduleViewScreen(),
      ],
      ),
    );
  }
}

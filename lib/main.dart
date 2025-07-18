import 'package:flutter/material.dart';
import 'package:mini_task_manager/screens/home/home_screen.dart';
import 'package:mini_task_manager/utils/theme_manager.dart';

void main() {
  runApp(const MiniTaskManager());
}

class MiniTaskManager extends StatelessWidget {
  const MiniTaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Task Manager',
      themeMode: ThemeMode.light,
      theme: ThemeManager.appTheme,
      home: HomeScreen(),
    );
  }
}

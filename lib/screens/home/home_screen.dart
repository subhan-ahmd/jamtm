import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/screens/home/widgets/new_task_bottom_sheet.dart';
import 'package:mini_task_manager/widgets/basic_bottom_sheet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mini Task Manager"),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        onPressed: () {
          BasicBottomSheet.openSheet(context, NewTaskBottomSheet());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

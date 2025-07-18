import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_task_manager/widgets/basic_bottom_sheet.dart';

class NewTaskBottomSheet extends ConsumerStatefulWidget {
  const NewTaskBottomSheet({super.key});

  @override
  ConsumerState createState() => _NewTaskBottomSheetState();
}

class _NewTaskBottomSheetState extends ConsumerState<NewTaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BasicBottomSheet();
  }
}

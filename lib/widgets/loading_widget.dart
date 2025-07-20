import 'package:flutter/material.dart';
import 'package:mini_task_manager/widgets/basic_loading_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: BasicLoadingWidget());
  }
}

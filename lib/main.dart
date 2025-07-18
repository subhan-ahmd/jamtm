import 'package:flutter/material.dart';

void main() {
  runApp(const MiniTaskManager());
}

class MiniTaskManager extends StatelessWidget {
  const MiniTaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Task Manager',
      home: Scaffold(appBar: AppBar(title: Text("Mini Task Manager"))),
    );
  }
}

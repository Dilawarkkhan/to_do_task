import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/task_model.dart';
import 'providers/list_provider.dart';

class TaskderailScreen extends StatelessWidget {
  const TaskderailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Task task = context.watch<TaskProvider>().tasks[0];

    return Scaffold(
      appBar: AppBar(title: const Text('Task Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(task.title),
      ),
    );
  }
}

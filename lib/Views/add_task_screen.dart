import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_task/providers/task_provider.dart';
import 'package:to_do_task/widgets/app_bar.dart';
import 'package:to_do_task/widgets/buttons/elevated_button.dart';

import '../models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late final TextEditingController _descriptionText;

  @override
  void initState() {
    _descriptionText = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _descriptionText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(0, 65),
        child: CustomAppBar(
          title: "Add Task",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _descriptionText,
              decoration: const InputDecoration(
                labelText: 'Write description',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButtonWidget(
            buttonText: 'Save Task',
            onPressed: () {
              final task = Task(
                title: _descriptionText.text,
                id: UniqueKey().toString(),
              );
              context.read<TaskProvider>().addTask(task);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

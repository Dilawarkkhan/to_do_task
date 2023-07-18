import 'package:flutter/material.dart';
import 'package:to_do_task/models/task_model.dart';
import 'package:to_do_task/widgets/app_bar.dart';
import 'package:to_do_task/widgets/buttons/elevated_button.dart';

class UpdateScreen extends StatefulWidget {
  final Task task;
  const UpdateScreen({super.key, required this.task});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.task.title);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(0, 65),
        child: CustomAppBar(
          title: " View Task",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: 'Task Title',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButtonWidget(
              onPressed: () {
                final editedTask = Task(
                  id: widget.task.id,
                  title: _textEditingController.text,
                  isDone: widget.task.isDone,
                );
                Navigator.pop(context, editedTask);
              },
              buttonText: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_task/providers/list_provider.dart';
import 'package:to_do_task/widgets/appbar.dart';

import 'home_screen.dart';
import 'models/task_model.dart';

class AddTextScreen extends StatefulWidget {
  const AddTextScreen({super.key, required int index});

  @override
  State<AddTextScreen> createState() => _AddTextScreenState();
}

class _AddTextScreenState extends State<AddTextScreen> {
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
        child: CustomAppbar(),
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
          ElevatedButton(
            onPressed: () {
              final task = Task(title: _descriptionText.text);
              context.read<TaskProvider>().addTask(task);
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 182, 44, 6),
              ), // Replace with your desired color
            ),
            child: const Text(
              'Save Text',
            ),
          ),
        ],
      ),
    );
  }
}

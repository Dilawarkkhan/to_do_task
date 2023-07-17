import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_task/user_description_screen.dart';

import 'package:to_do_task/widgets/appbar.dart';

import 'providers/list_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(0, 65),
        child: CustomAppbar(),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemCount: provider.tasks.length,
          itemBuilder: (context, index) {
            var task = provider.tasks[index];
            return ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTextScreen(index: index),
                ),
              ),
              title: Text(task.title),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => provider.deleteTask(task),
              ),
              leading: Checkbox(
                value: task.isDone,
                onChanged: (value) => provider.toggleTask(task),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTextScreen(index: 0),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 182, 44, 6),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

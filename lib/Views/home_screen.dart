import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_task/Views/view_screen.dart';


import 'package:to_do_task/providers/task_provider.dart';


import 'package:to_do_task/widgets/app_bar.dart';
import 'package:to_do_task/widgets/buttons/floating_button.dart';

import 'add_task_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(0, 65),
        child: CustomAppBar(
          title: "User Notes",
        ),
      ),
      body: Consumer<TaskProvider>(
        builder: (_, provider, child) => ListView.builder(
          itemCount: provider.tasks.length,
          itemBuilder: (context, index) {
            var task = provider.tasks[index];
            return ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  ViewScreen(task: task,),
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
      floatingActionButton: FloatingButtonWidget(
        iconData: Icons.add,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

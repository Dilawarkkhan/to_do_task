import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    _saveTasks();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    _saveTasks();
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.isDone = !task.isDone;
    _saveTasks();
    notifyListeners();
  }

  void _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = jsonEncode(_tasks.map((task) => task.toMap()).toList());
    prefs.setString('tasks', tasksJson);
  }

  void loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString('tasks') ?? '[]';
    final taskList = jsonDecode(tasksJson) as List;
    _tasks = taskList.map((taskMap) => Task.fromMap(taskMap)).toList();
    notifyListeners();
  }
}

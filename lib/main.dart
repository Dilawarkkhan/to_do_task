import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_task/core/app_theme.dart';


import 'providers/task_provider.dart';
import 'Views/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TaskProvider()..loadTasks(),
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: AppThemes.appBarColor,
          ),
          home: const HomeScreen(),
        ));
  }
}

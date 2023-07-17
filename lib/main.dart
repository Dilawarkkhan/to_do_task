import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_task/home_screen.dart';

import 'providers/list_provider.dart';

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
            primaryColor: const Color.fromARGB(255, 182, 44, 6),
          ),
          home: const HomeScreen(),
        ));
  }
}

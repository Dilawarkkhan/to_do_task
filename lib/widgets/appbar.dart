import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Icon(
            Icons.notes_sharp,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(width: 8),
          const Text(
            'User Notes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 182, 44, 6),
      elevation: 0,
    );
  }
}

import 'package:flutter/material.dart';

import '../core/app_theme.dart';

class CustomAppBar extends StatelessWidget {
  final String? title; 
  final Icon? icon;
  const CustomAppBar({super.key,  this.title, this.icon });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Row(
        children: [
          const Visibility(
            child:  Icon(
              Icons.notes_sharp,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            "$title",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      backgroundColor:AppThemes.appBarColor,
      elevation: 0,
    );
  }
}

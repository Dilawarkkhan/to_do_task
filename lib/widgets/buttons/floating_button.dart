import 'package:flutter/material.dart';

import '../../core/app_theme.dart';

class FloatingButtonWidget extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  const FloatingButtonWidget({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppThemes.appBarColor,
      child: Icon(iconData),
    );
  }
}

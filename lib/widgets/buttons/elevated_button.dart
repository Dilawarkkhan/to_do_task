import 'package:flutter/material.dart';

import '../../core/app_theme.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const ElevatedButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          AppThemes.appBarColor,
        ),
      ),
      child: Text(buttonText),
    );
  }
}

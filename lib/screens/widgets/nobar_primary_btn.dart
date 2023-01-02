import 'package:flutter/material.dart';
import 'package:nobar_app/utils/colors.dart';

class NobarPrimaryBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const NobarPrimaryBtn({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}

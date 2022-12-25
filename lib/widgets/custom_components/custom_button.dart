import 'package:flutter/material.dart';
import 'package:lootlo/utils/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppConstants.borderRadius,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
        textStyle: const TextStyle(
          fontSize: AppConstants.buttonTextFontSize,
        ),
      ),
      child: Text(text),
    );
  }
}

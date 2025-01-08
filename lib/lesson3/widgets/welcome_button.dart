
import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
    this.buttonText,
    this.textColor,
    required this.onTap,
    required this.bgBolor
  });

  final String? buttonText;
  final Color? textColor;
  final Color? bgBolor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!,
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: bgBolor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
        ),
        child: Text(
          buttonText!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
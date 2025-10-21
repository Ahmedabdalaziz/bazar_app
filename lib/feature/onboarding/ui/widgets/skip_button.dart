import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final TextStyle? style;

  const SkipButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(label, style: style),
      ),
    );
  }
}

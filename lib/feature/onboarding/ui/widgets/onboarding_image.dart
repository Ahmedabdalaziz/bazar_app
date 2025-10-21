import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const OnboardingImage({super.key, required this.imagePath, this.width, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
        width: width,
      ),
    );
  }
}


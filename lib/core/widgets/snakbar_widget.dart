import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedSnackBar extends StatefulWidget {
  final String message;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final SnackBarBehavior behavior;
  final EdgeInsetsGeometry? margin;

  const AnimatedSnackBar({
    super.key,
    required this.message,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.behavior = SnackBarBehavior.floating,
    this.margin,
  });

  @override
  State<AnimatedSnackBar> createState() => _AnimatedSnackBarState();
}

class _AnimatedSnackBarState extends State<AnimatedSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutBack,
            reverseCurve: Curves.easeInBack,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor =
        widget.backgroundColor ?? Theme.of(context).colorScheme.primary;
    final effectiveTextColor = widget.textColor ?? Colors.white;

    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            if (widget.icon != null) ...[
              Icon(widget.icon, color: effectiveTextColor),
              SizedBox(width: 12.w),
            ],
            Expanded(
              child: Text(
                widget.message,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: effectiveTextColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

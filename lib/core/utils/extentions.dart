import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/snakbar_widget.dart';

extension Navigation on BuildContext {
  Future pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  Future pushReplacementNamed<T>(String routName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routName, arguments: arguments);
  }

  Future pushNamedAndRemoveUntil<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  void pop([dynamic result]) {
    Navigator.of(this).pop(result);
  }

  void popUntil(bool Function(Route<dynamic>) predicate) {
    Navigator.of(this).popUntil(predicate);
  }
}

extension BuildContextSnackBarExtension on BuildContext {
  void showSnackBar(
    String message, {
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    Duration duration = const Duration(seconds: 5),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry? margin,
    bool isError = false,
    bool isSuccess = false,
  }) {
    final messenger = ScaffoldMessenger.of(this);

    messenger.clearSnackBars();

    Color effectiveBackgroundColor;
    if (isError) {
      effectiveBackgroundColor = Colors.red.shade700;
    } else if (isSuccess) {
      effectiveBackgroundColor = Colors.green.shade700;
    } else {
      effectiveBackgroundColor = Color(0xFFD7BE00);
    }

    messenger.showSnackBar(
      SnackBar(
        content: AnimatedSnackBar(
          message: message,
          backgroundColor: effectiveBackgroundColor,
          textColor: textColor,
          icon: icon,
          behavior: behavior,
          margin: margin,
        ),
        behavior: behavior,
        backgroundColor: Colors.transparent,
        elevation: 0,
        margin:
            margin ?? EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w),
        duration: duration,
      ),
    );
  }
}

extension NoDoubleClick on VoidCallback {
  VoidCallback noDoubleClick() {
    bool canClick = true;

    return () {
      if (!canClick) return;

      canClick = false;
      this();

      Future.delayed(const Duration(seconds: 2), () {
        canClick = true;
      });
    };
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}

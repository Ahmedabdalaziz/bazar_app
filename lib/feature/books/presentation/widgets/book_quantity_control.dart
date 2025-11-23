import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookQuantityControl extends StatefulWidget {
  const BookQuantityControl({super.key});

  @override
  State<BookQuantityControl> createState() => _BookQuantityControlState();
}

class _BookQuantityControlState extends State<BookQuantityControl> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: _decrementQuantity,
          icon: const Icon(Icons.remove_circle_outline),
          color: context.colorScheme.primary,
          iconSize: 32.sp,
        ),
        horizontalSpace(16),
        Text(
          '$_quantity',
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        horizontalSpace(16),
        IconButton(
          onPressed: _incrementQuantity,
          icon: const Icon(Icons.add_circle_outline),
          color: context.colorScheme.primary,
          iconSize: 32.sp,
        ),
      ],
    );
  }
}

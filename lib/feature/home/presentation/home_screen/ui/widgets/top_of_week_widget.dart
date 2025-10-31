import 'package:flutter/material.dart';

class TopOfWeekWidget extends StatefulWidget {
  const TopOfWeekWidget({super.key});

  @override
  State<TopOfWeekWidget> createState() => _TopOfWeekWidgetState();
}

class _TopOfWeekWidgetState extends State<TopOfWeekWidget> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (builder, value) {
        return Row(children: []);
      },
      scrollDirection: Axis.horizontal,
      physics: FixedExtentScrollPhysics(),
      itemCount: 5,
      controller: _pageController,

    );
  }
}

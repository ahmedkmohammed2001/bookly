// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.sliderAnimation,
  }) : super(key: key);

  final Animation<Offset> sliderAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: sliderAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: sliderAnimation,
            child: const Text(
              "Read Free Books",
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}

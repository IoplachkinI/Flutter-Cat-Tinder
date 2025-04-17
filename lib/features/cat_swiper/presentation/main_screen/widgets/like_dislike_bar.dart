import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeDislikeBar extends StatelessWidget {
  const LikeDislikeBar({
    super.key,
    required this.lastPercentage,
    required this.curPercentage,
  });

  final double lastPercentage;
  final double curPercentage;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      tween: Tween<double>(begin: lastPercentage, end: curPercentage),
      builder:
          (context, value, _) => LinearProgressIndicator(
            value: value,
            minHeight: 5,
            color: const Color.fromARGB(255, 30, 30, 30),
            backgroundColor: Colors.red,
          ),
    );
  }
}

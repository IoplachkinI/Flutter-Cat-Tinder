import 'package:flutter/cupertino.dart';
import "package:cat_tinder/core/utils/values/colors.dart";

class LikeDislikeCount extends StatelessWidget {
  const LikeDislikeCount({
    super.key,
    required this.dislikeCount,
    required this.likeCount,
  });

  final int dislikeCount;
  final int likeCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$dislikeCount",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "$likeCount",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
